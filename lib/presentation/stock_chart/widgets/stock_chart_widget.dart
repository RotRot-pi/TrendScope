import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:trendscope/core/enums.dart';
import 'package:trendscope/domain/model/stock_data.dart';
import 'package:trendscope/presentation/common/helpers/chart_data_processor.dart';
import 'package:trendscope/presentation/common/objects/chart_data_object.dart';
import 'package:trendscope/presentation/stock_chart/provider/stock_chart_provider.dart';
import 'package:trendscope/presentation/stock_chart/widgets/candlestick_chart_widget.dart';
import 'package:trendscope/presentation/stock_chart/widgets/volume_chart_widget.dart';

class StockChartWidget extends ConsumerWidget {
  const StockChartWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stockDataAsyncValue =
        ref.watch(stockChartDataProvider(ref.watch(selectedTimeFrameProvider)));
    final selectedTimeFrame = ref.watch(selectedTimeFrameProvider);
    final selectedPeriod = ref.watch(selectedPeriodProvider);
    return stockDataAsyncValue.when(
      data: (stockData) {
        final chartData = _processChartData(stockData, selectedTimeFrame);

        // If there's no data, show a placeholder message
        if (chartData.isEmpty) {
          return const Center(
            child: Text('No data available for this timeframe.'),
          );
        }

        // Calculate chart configuration based on processed chart data
        final config = ChartDataProcessor.calculateChartConfig(
          chartData,
          selectedTimeFrame,
          selectedPeriod,
        );

        return Column(
          children: [
            // CandleStick Chart takes the majority of the space
            Expanded(
              child: CandleStickChartWidget(
                minimumDate: config.minimumDate,
                maximumDate: config.maximumDate,
                minPrice: config.minPrice,
                maxPrice: config.maxPrice,
                dateFormat: config.dateFormat,
                chartData: chartData,
              ),
            ),
            // Volume chart widget, occupying 100px height
            SizedBox(
              height: 100,
              child: VolumeChartWidget(
                minimumDate: config.minimumDate,
                maximumDate: config.maximumDate,
                dateFormat: config.dateFormat,
                chartData: chartData,
              ),
            ),
          ],
        );
      },
      // Show loading spinner while data is being fetched
      loading: () => const Center(child: CircularProgressIndicator()),
      // Display an error message if something goes wrong
      error: (error, stackTrace) => Center(
        child: Text('Error loading data: $error'),
      ),
    );
  }

  // Function to process raw stock data into chart data
  List<ChartData> _processChartData(
      StockData stockData, ChartTimeFrame timeFrame) {
    // Switch between different time series based on the selected timeframe
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

    // If there's no data available for the selected timeframe, return an empty list
    if (timeSeries == null || timeSeries.isEmpty) {
      return [];
    }

    // Sort the time series entries by date in descending order
    var sortedEntries = timeSeries.entries.toList()
      ..sort((a, b) => b.key.compareTo(a.key));

    // If sorted entries are empty, return an empty list
    if (sortedEntries.isEmpty) return [];

    // Map each entry to ChartData, parsing the date and other values
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
}
