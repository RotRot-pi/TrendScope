import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:trendscope/presentation/common/objects/chart_data_object.dart';
import 'package:trendscope/presentation/stock_chart/provider/stock_chart_provider.dart';

class CandleStickChartWidget extends ConsumerWidget {
  const CandleStickChartWidget({
    super.key,
    required this.minimumDate,
    required this.maximumDate,
    required this.minPrice,
    required this.maxPrice,
    required this.chartData,
    required this.dateFormat,
  });

  final DateTime minimumDate;
  final DateTime maximumDate;
  final double? minPrice;
  final double? maxPrice;
  final DateFormat dateFormat;
  final List<ChartData> chartData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedChartType = ref.watch(selectedChartTypeProvider);
    return SfCartesianChart(
      zoomPanBehavior: ZoomPanBehavior(
          enableSelectionZooming: true,
          enablePinching: true,
          enableDoubleTapZooming: true,
          enableMouseWheelZooming: true,
          enablePanning: true,
          zoomMode: ZoomMode.xy),
      primaryXAxis: DateTimeAxis(
        minimum: minimumDate,
        maximum: maximumDate,
        dateFormat: dateFormat,
        intervalType: DateTimeIntervalType.days,
        majorGridLines: const MajorGridLines(width: 0.5, color: Colors.grey),
      ),
      primaryYAxis: NumericAxis(
        minimum: minPrice,
        maximum: maxPrice,
        numberFormat:
            NumberFormat.compactCurrency(symbol: '\$', decimalDigits: 0),
        decimalPlaces: 2,
        majorGridLines: const MajorGridLines(width: 0.5, color: Colors.grey),
      ),
      series: [
        if (selectedChartType == 'Candlestick')
          CandleSeries<ChartData, DateTime>(
            dataSource: chartData,
            xValueMapper: (ChartData data, _) => data.date,
            lowValueMapper: (ChartData data, _) => data.low,
            highValueMapper: (ChartData data, _) => data.high,
            openValueMapper: (ChartData data, _) => data.open,
            closeValueMapper: (ChartData data, _) => data.close,
            enableTooltip: true,
            trendlines: _getTrendlines(ref),
          ),
        if (selectedChartType == 'Line')
          LineSeries<ChartData, DateTime>(
            dataSource: chartData,
            xValueMapper: (ChartData data, _) => data.date,
            yValueMapper: (ChartData data, _) => data.close,
          ),
        if (ref.watch(showOpenCloseMarkesProvider))
          _buildScatterForOpeningPrice(),
        if (ref.watch(showOpenCloseMarkesProvider))
          _buildScatterForClosingPrice(),
      ],
      tooltipBehavior: TooltipBehavior(enable: true),
      crosshairBehavior: CrosshairBehavior(enable: true),
    );
  }

  _buildScatterForOpeningPrice() {
    return ScatterSeries<ChartData, DateTime>(
      dataSource: chartData,
      xValueMapper: (ChartData data, _) => data.date,
      yValueMapper: (ChartData data, _) => data.open,
      markerSettings: const MarkerSettings(
        isVisible: true,
        height: 5,
        width: 5,
        shape: DataMarkerType.circle,
        color: Colors.blue,
        borderWidth: 2,
        borderColor: Colors.blue,
      ),
    );
  }

  _buildScatterForClosingPrice() {
    return ScatterSeries<ChartData, DateTime>(
      dataSource: chartData,
      xValueMapper: (ChartData data, _) => data.date,
      yValueMapper: (ChartData data, _) => data.close,
      markerSettings: const MarkerSettings(
        isVisible: true,
        height: 5,
        width: 5,
        shape: DataMarkerType.rectangle,
        color: Colors.red,
        borderWidth: 2,
        borderColor: Colors.red,
      ),
    );
  }

  // Function to get the list of trendlines based on user selections
  List<Trendline> _getTrendlines(WidgetRef ref) {
    final trendlines = <Trendline>[];

    if (ref.watch(trendlineVisibilityProvider(TrendlineType.linear))) {
      trendlines.add(
          Trendline(type: TrendlineType.linear, color: Colors.blue, width: 2));
    }

    if (ref.watch(trendlineVisibilityProvider(TrendlineType.movingAverage))) {
      trendlines.add(Trendline(
          type: TrendlineType.movingAverage,
          color: Colors.red,
          width: 2,
          period: 7)); // Adjust the period as needed
    }

    if (ref.watch(trendlineVisibilityProvider(TrendlineType.exponential))) {
      trendlines.add(Trendline(
          type: TrendlineType.exponential, color: Colors.green, width: 2));
    }

    return trendlines;
  }
}
