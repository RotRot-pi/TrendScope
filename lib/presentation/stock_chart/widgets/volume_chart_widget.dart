import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:trendscope/presentation/common/objects/chart_data_object.dart';
import 'package:trendscope/presentation/stock_chart/provider/stock_chart_provider.dart';

class VolumeChartWidget extends ConsumerWidget {
  const VolumeChartWidget({
    super.key,
    required this.chartData,
  });

  final List<ChartData> chartData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedChartType = ref.watch(selectedChartTypeProvider);
    return SfCartesianChart(
      primaryXAxis: DateTimeAxis(
        dateFormat: DateFormat.MMMEd(),
        intervalType: DateTimeIntervalType.days,
        majorGridLines: const MajorGridLines(width: 0.5, color: Colors.grey),
      ),
      primaryYAxis: const NumericAxis(
        majorGridLines: MajorGridLines(width: 0.5, color: Colors.grey),
      ),
      zoomPanBehavior: ZoomPanBehavior(
          enableSelectionZooming: true,
          enablePinching: true,
          enableDoubleTapZooming: true,
          enableMouseWheelZooming: true,
          enablePanning: true,
          zoomMode: ZoomMode.xy),
      series: [
        ColumnSeries<ChartData, DateTime>(
          dataSource: chartData,
          xValueMapper: (ChartData data, _) => data.date,
          yValueMapper: (ChartData data, _) => data.volume,
          enableTooltip: true,
        ),
      ],
      tooltipBehavior: TooltipBehavior(enable: true),
      crosshairBehavior: CrosshairBehavior(enable: true),
    );
  }
}
