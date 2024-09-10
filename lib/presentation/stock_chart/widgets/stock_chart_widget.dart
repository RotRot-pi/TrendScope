import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:trendscope/domain/model/stock_data.dart';

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
          maximum: (100 * double.parse(maxVolume)) / 6,
          isVisible: false,
        )
      ],
      primaryXAxis: DateTimeAxis(
        dateFormat: DateFormat('EEE'),
        intervalType: DateTimeIntervalType.days,
        interval: 1,
        //show only the last 7 days
        minimum: min,
        maximum: max,
        majorGridLines: const MajorGridLines(width: 1),
      ),
      primaryYAxis: const NumericAxis(
        minimum: 140,
        maximum: 160,
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
