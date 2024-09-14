import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:trendscope/core/constant.dart';
import 'package:trendscope/core/enums.dart';
import 'package:trendscope/domain/model/stock_data.dart';
import 'package:trendscope/main.dart';
import 'package:trendscope/presentation/common/helpers/chart_data_processor.dart';
import 'package:trendscope/presentation/common/objects/chart_data_object.dart';
import 'package:trendscope/presentation/stock_chart/provider/stock_chart_provider.dart';
import 'dart:math' as math;

import 'package:trendscope/presentation/stock_chart/widgets/candlestick_chart_widget.dart';
import 'package:trendscope/presentation/stock_chart/widgets/volume_chart_widget.dart';

class StockChartWidget extends ConsumerWidget {
  final String symbol;

  const StockChartWidget({super.key, required this.symbol});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stockDataAsyncValue = ref.watch(
        stockChartDataProvider((symbol, ref.watch(selectedTimeFrameProvider))));

    return Scaffold(
      appBar: AppBar(
        title: Text("Stock Data for $symbol"),
      ),
      body: Column(
        children: [
          _buildChartTypeSelector(ref),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTimeframeSelector(ref),
                  _buildPeriodSelector(ref),
                  _buildTrendlineSelector(ref),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      ref.read(showTrendlineProvider.notifier).state =
                          !ref.read(showTrendlineProvider);
                    },
                    child: const Text('Toggle Trendline'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      ref.read(showOpenCloseMarkesProvider.notifier).state =
                          !ref.read(showOpenCloseMarkesProvider);
                    },
                    child: const Text('Toggle Open/Closed Markers'),
                  )
                ],
              ),
            ],
          ),
          Expanded(
            child: _buildChart(
                stockDataAsyncValue,
                ref.watch(selectedTimeFrameProvider),
                ref.watch(selectedPeriodProvider)),
          ),
        ],
      ),
    );
  }

  // Timeframe Selector
  Widget _buildTimeframeSelector(WidgetRef ref) {
    return SegmentedButton<ChartTimeFrame>(
      segments: ChartTimeFrame.values.map((timeframe) {
        return ButtonSegment<ChartTimeFrame>(
          value: timeframe,
          label: Text(timeframe.toString().split('.').last),
        );
      }).toList(),
      selected: {ref.watch(selectedTimeFrameProvider)},
      onSelectionChanged: (Set<ChartTimeFrame> newSelection) {
        final newTimeframe = newSelection.first;
        ref.read(selectedTimeFrameProvider.notifier).state = newTimeframe;

        // Adjust the selected period if necessary
        final currentPeriod = ref.read(selectedPeriodProvider);
        final validPeriods = _getValidPeriods(newTimeframe);
        if (!validPeriods.contains(currentPeriod)) {
          // Find the closest valid period
          final newPeriod = validPeriods.lastWhere(
            (period) =>
                periods.indexOf(period) <= periods.indexOf(currentPeriod),
            orElse: () => validPeriods.first,
          );
          ref.read(selectedPeriodProvider.notifier).state = newPeriod;
        }
      },
    );
  }

  // Chart Builder
  Widget _buildChart(AsyncValue<StockData> stockDataAsyncValue,
      ChartTimeFrame selectedTimeFrame, String selectedPeriod) {
    return stockDataAsyncValue.when(
      data: (stockData) {
        final chartData = _processChartData(stockData, selectedTimeFrame);
        if (chartData.isEmpty) {
          return const Center(
              child: Text('No data available for this timeframe.'));
        }
        final config = ChartDataProcessor.calculateChartConfig(
          chartData,
          selectedTimeFrame,
          selectedPeriod,
        );
        return Column(
          children: [
            Expanded(
              child: CandleStickChartWidget(
                  minimumDate: config.minimumDate,
                  maximumDate: config.maximumDate,
                  minPrice: config.minPrice,
                  maxPrice: config.maxPrice,
                  dateFormat: config.dateFormat,
                  chartData: chartData),
            ),
            SizedBox(
              height: 100,
              child: VolumeChartWidget(chartData: chartData),
            ),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) =>
          Center(child: Text('Error loading data: $error')),
    );
  }

  List<ChartData> _processChartData(
      StockData stockData, ChartTimeFrame timeFrame) {
    Map<String, dynamic>? timeSeries;
    switch (timeFrame) {
      case ChartTimeFrame.daily:
        timeSeries = stockData.timeSeriesDaily;
        break;
      case ChartTimeFrame.weekly:
        timeSeries = stockData.timeSeriesWeekly;
        break;
      case ChartTimeFrame.monthly:
        timeSeries = stockData.timeSeriesMonthly;
        break;
      case ChartTimeFrame.yearly:
        timeSeries = stockData.timeSeriesYearly;
        break;
      case ChartTimeFrame.fiveYears:
        timeSeries = stockData.timeSeriesFiveYears;
        break;
    }

    if (timeSeries == null || timeSeries.isEmpty) {
      appLogger.w("No data available for $timeFrame");
      return [];
    }

    var sortedEntries = timeSeries.entries.toList()
      ..sort((a, b) => b.key.compareTo(a.key));

    if (sortedEntries.isEmpty) return []; // Handle empty data

    return sortedEntries.map((entry) {
      final date = DateFormat('yyyy-MM-dd').parse(entry.key);
      final data = entry.value;
      return ChartData(
        date: date,
        open: double.tryParse(data.open) ?? 0,
        high: double.tryParse(data.high) ?? 0,
        low: double.tryParse(data.low) ?? 0,
        close: double.tryParse(data.close) ?? 0,
        volume: double.tryParse(data.volume) ?? 0,
      );
    }).toList();
  }

  Widget _buildPeriodSelector(WidgetRef ref) {
    final selectedTimeFrame = ref.watch(selectedTimeFrameProvider);
    final validPeriods = _getValidPeriods(selectedTimeFrame);
    appLogger.i("Valid periods: $validPeriods");
    return DropdownButton<String>(
      value: ref.watch(selectedPeriodProvider),
      items: validPeriods.map((period) {
        appLogger.i("Period: $period");
        return DropdownMenuItem<String>(
          value: period,
          child: Text(period),
        );
      }).toList(),
      onChanged: (String? newPeriod) {
        ref.read(selectedPeriodProvider.notifier).state = newPeriod!;
      },
    );
  }

  List<String> _getValidPeriods(ChartTimeFrame timeframe) {
    switch (timeframe) {
      case ChartTimeFrame.daily:
        return [
          'Last Day',
          'Last Week',
          'Last Month',
          'Last 3 Months',
          'Last 6 Months',
          'Last Year',
          '5 Years'
        ];
      case ChartTimeFrame.weekly:
        return [
          'Last Week',
          'Last Month',
          'Last 3 Months',
          'Last 6 Months',
          'Last Year',
          '5 Years'
        ];
      case ChartTimeFrame.monthly:
        return [
          'Last Month',
          'Last 3 Months',
          'Last 6 Months',
          'Last Year',
          '5 Years'
        ];
      case ChartTimeFrame.yearly:
        return ['Last Year', '5 Years'];
      case ChartTimeFrame.fiveYears:
        return ['5 Years'];
      default:
        return [
          'Last Day',
          'Last Week',
          'Last Month',
          'Last 3 Months',
          'Last 6 Months',
          'Last Year',
          '5 Years'
        ];
    }
  }

  // Trendline Selection UI
  Widget _buildTrendlineSelector(WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildTrendlineCheckbox(ref, 'Linear', TrendlineType.linear),
        _buildTrendlineCheckbox(
            ref, 'Moving Average', TrendlineType.movingAverage),
        _buildTrendlineCheckbox(ref, 'Exponential', TrendlineType.exponential),
      ],
    );
  }

  // Helper function to create a checkbox for each trendline type
  Widget _buildTrendlineCheckbox(
      WidgetRef ref, String label, TrendlineType type) {
    return Row(
      children: [
        Checkbox(
          value: ref.watch(trendlineVisibilityProvider(type)),
          onChanged: (value) {
            ref.read(trendlineVisibilityProvider(type).notifier).state = value!;
          },
        ),
        Text(label),
      ],
    );
  }

  Widget _buildChartTypeSelector(WidgetRef ref) {
    return SegmentedButton<String>(
      segments: const [
        ButtonSegment(value: 'Candlestick', label: Text('Candlestick')),
        ButtonSegment(value: 'Line', label: Text('Line')),
      ],
      selected: {ref.watch(selectedChartTypeProvider)},
      onSelectionChanged: (Set<String> newSelection) {
        ref.read(selectedChartTypeProvider.notifier).state = newSelection.first;
      },
    );
  }
}
