import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:trendscope/domain/model/stock_data.dart';

class DailyStockChartWidget extends StatelessWidget {
  const DailyStockChartWidget({
    super.key,
    required this.data,
  });

  final Map<String, DailyData> data;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      title: const ChartTitle(text: 'Daily Stock Data'),
      primaryXAxis: DateTimeAxis(
        dateFormat: DateFormat('EEE'),
        majorGridLines: const MajorGridLines(width: 1),
      ),
      primaryYAxis: const NumericAxis(
        title: AxisTitle(text: 'Price (USD)'), // Example label
        majorGridLines: MajorGridLines(width: 1),
      ),
      axes: <ChartAxis>[
        const NumericAxis(
          name: 'Y-Axis',
          opposedPosition: true,
          title: AxisTitle(text: 'Volume'),
          isVisible: true,
        )
      ],
      zoomPanBehavior: ZoomPanBehavior(
        enablePinching: true,
        enablePanning: true,
        zoomMode: ZoomMode.x,
      ),
      trackballBehavior: TrackballBehavior(
        enable: true,
        activationMode: ActivationMode.longPress,
      ),
      series: <CartesianSeries>[
        CandleSeries<MapEntry<String, DailyData>, DateTime>(
          dataSource: data.entries.toList(),
          xValueMapper: (data, _) => DateTime.parse(data.key),
          openValueMapper: (data, _) => double.tryParse(data.value.open),
          highValueMapper: (data, _) => double.tryParse(data.value.high),
          lowValueMapper: (data, _) => double.tryParse(data.value.low),
          closeValueMapper: (data, _) => double.tryParse(data.value.close),
        ),
        ColumnSeries<MapEntry<String, DailyData>, DateTime>(
          yAxisName: 'Y-Axis',
          dataSource: data.entries.toList(),
          xValueMapper: (data, _) => DateTime.parse(data.key),
          yValueMapper: (data, _) => double.tryParse(data.value.volume),
        ),
      ],
    );
  }
}
