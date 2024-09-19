import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trendscope/presentation/common/helpers/chart_data_processor.dart';
import 'package:trendscope/presentation/common/helpers/stock_chart_helper.dart';
import 'package:trendscope/presentation/stock_chart/provider/stock_chart_provider.dart';
import 'package:trendscope/presentation/stock_chart/widgets/candlestick_chart_widget.dart';

class StockChartWidget extends ConsumerWidget {
  const StockChartWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stockDataAsyncValue =
        ref.watch(stockChartDataProvider(ref.watch(selectedTimeFrameProvider)));
    final selectedTimeFrame = ref.watch(selectedTimeFrameProvider);
    final selectedPeriod = ref.watch(selectedPeriodProvider);

    return Expanded(
      child: stockDataAsyncValue.when(
        data: (stockDataList) {
          if (stockDataList.isEmpty) {
            return const Center(
              child: Text('No data available for this timeframe.'),
            );
          }
          // Flatten the list of lists into a single list of ChartData
          final chartData = stockDataList
              .map((stockData) => StockChartHelpers.processChartData(
                  stockData, selectedTimeFrame))
              .expand((data) => data)
              .toList();

          // Calculate chart configuration based on processed chart data
          final config = ChartDataProcessor.calculateChartConfig(
            chartData,
            selectedTimeFrame,
            selectedPeriod,
          );
          return CandleStickChartWidget(
            minimumDate: config.minimumDate,
            maximumDate: config.maximumDate,
            minPrice: config.minPrice,
            maxPrice: config.maxPrice,
            minVolume: config.minVolume,
            maxVolume: config.maxVolume,
            dateFormat: config.dateFormat,
            chartData: chartData,
          );
        },
        // Show loading spinner while data is being fetched
        loading: () => const Center(child: CircularProgressIndicator()),
        // Display an error message if something goes wrong
        error: (error, stackTrace) => Center(
          child: Text('Error loading data: $error'),
        ),
      ),
    );
  }
}
