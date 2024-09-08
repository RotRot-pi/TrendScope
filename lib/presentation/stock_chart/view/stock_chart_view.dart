//create the view (screen) for stock chart using syncfusion candlestick chart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:trendscope/domain/model/stock_data.dart';
import 'package:trendscope/presentation/stock_chart/provider/stock_chart_provider.dart';

class StockChartView extends ConsumerWidget {
  const StockChartView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stockData = ref.watch(stockChartProvider('AAPL'));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stock Chart'),
      ),
      body: stockData.when(
        data: (data) {
          print("Min Date: ${data.timeSeriesDaily.keys.first}");
          print("Max Date: ${data.timeSeriesDaily.keys.last}");
          List<String> dates = data.timeSeriesDaily.keys.toList();
          //last 7 days
          var min = DateTime.parse(dates[dates.length - 9]);
          var max = DateTime.parse(dates[dates.length - 1]);

          var minVolume = data.timeSeriesDaily.values
              .skip(dates.length - 9)
              .reduce((curr, next) =>
                  double.parse(curr.volume) < double.parse(next.volume)
                      ? curr
                      : next)
              .volume;
          var maxVolume = data.timeSeriesDaily.values
              .skip(dates.length - 9)
              .reduce((curr, next) =>
                  double.parse(curr.volume) > double.parse(next.volume)
                      ? curr
                      : next)
              .volume;
          return StockChartWidget(
              data: data, maxVolume: maxVolume, min: min, max: max);
        },
        error: (error, stackTrace) => Center(child: Text(error.toString())),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class StockChartWidget extends StatelessWidget {
  const StockChartWidget({
    super.key,
    required this.maxVolume,
    required this.min,
    required this.max,
    required this.data,
  });
  final StockData data;
  final String maxVolume;
  final DateTime min;
  final DateTime max;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      axes: <ChartAxis>[
        NumericAxis(
          name: 'Y-Axis',
          opposedPosition: true,
          maximum: (100 * double.parse(maxVolume)) / 5,
          isVisible: false,
        )
      ],
      primaryXAxis: DateTimeAxis(
        dateFormat: DateFormat('EEE, d'),
        intervalType: DateTimeIntervalType.days,
        interval: 1,
        //show only the last 7 days
        minimum: min,
        maximum: max,
        majorGridLines: const MajorGridLines(width: 1),
      ),
      primaryYAxis: const NumericAxis(
        minimum: 100,
        maximum: 180,
        majorGridLines: MajorGridLines(width: 1),
      ),
      series: <CartesianSeries>[
        CandleSeries<MapEntry<String, DailyData>, DateTime>(
          dataSource: data.timeSeriesDaily.entries.toList(),
          xValueMapper: (data, _) => DateTime.parse(data.key),
          openValueMapper: (data, _) => double.tryParse(data.value.open),
          highValueMapper: (data, _) => double.tryParse(data.value.high),
          lowValueMapper: (data, _) => double.tryParse(data.value.low),
          closeValueMapper: (data, _) => double.tryParse(data.value.close),
        ),
        ColumnSeries<MapEntry<String, DailyData>, DateTime>(
            yAxisName: 'Y-Axis',
            dataSource: data.timeSeriesDaily.entries.toList(),
            xValueMapper: (data, _) => DateTime.parse(data.key),
            yValueMapper: (data, _) => double.tryParse(data.value.volume)),
      ],
    );
  }
}
