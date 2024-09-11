import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:trendscope/domain/model/stock_data.dart';

class MonthlyStockChartWidget extends StatelessWidget {
  const MonthlyStockChartWidget({
    super.key,
    required this.data,
  });

  final Map<String, MonthlyData> data;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      title: ChartTitle(text: 'Monthly Stock Data'),
      primaryXAxis: DateTimeAxis(
        dateFormat: DateFormat('MMM yyyy'),
        majorGridLines: const MajorGridLines(width: 1),
      ),
      primaryYAxis: NumericAxis(
        title: AxisTitle(text: 'Price (USD)'),
        majorGridLines: const MajorGridLines(width: 1),
      ),
      axes: <ChartAxis>[
        NumericAxis(
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
        CandleSeries<MapEntry<String, MonthlyData>, DateTime>(
          dataSource: data.entries.toList(),
          xValueMapper: (data, _) => DateTime.parse(data.key),
          openValueMapper: (data, _) => double.tryParse(data.value.open),
          highValueMapper: (data, _) => double.tryParse(data.value.high),
          lowValueMapper: (data, _) => double.tryParse(data.value.low),
          closeValueMapper: (data, _) => double.tryParse(data.value.close),
        ),
        ColumnSeries<MapEntry<String, MonthlyData>, DateTime>(
          yAxisName: 'Y-Axis',
          dataSource: data.entries.toList(),
          xValueMapper: (data, _) => DateTime.parse(data.key),
          yValueMapper: (data, _) => double.tryParse(data.value.volume),
        ),
      ],
    );
  }
}
