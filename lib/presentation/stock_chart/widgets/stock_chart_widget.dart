import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:trendscope/domain/model/stock_data.dart';

// class StockChartWidget extends StatelessWidget {
//   const StockChartWidget({
//     super.key,
//     required this.data,
//     required this.selectedTimeRange, // Add the selectedTimeRange parameter
//   });

//   final data;
//   final String selectedTimeRange;

//   @override
//   Widget build(BuildContext context) {
//     // Get the appropriate time series data based on the selected range
//     dynamic timeSeriesData; // Use dynamic to handle different data types
//     switch (selectedTimeRange) {
//       case 'Daily':
//         timeSeriesData = data.timeSeriesDaily;
//         break;
//       case 'Weekly':
//         timeSeriesData = data.timeSeriesWeekly;
//         break;
//       case 'Monthly':
//         timeSeriesData = data.timeSeriesMonthly;
//         break;
//       case 'Yearly':
//         timeSeriesData = data.timeSeriesYearly;
//         break;
//       case '5 Years':
//         timeSeriesData = data.timeSeriesFiveYears;
//         break;
//       default:
//         timeSeriesData = data.timeSeriesDaily; // Default to Daily
//     }

//     return SfCartesianChart(
//       title: ChartTitle(
//           text:
//               '${data.metaData.symbol} - $selectedTimeRange'), // Add chart title
//       primaryXAxis: DateTimeAxis(
//         dateFormat: DateFormat('EEE'), // Format for the date labels
//         majorGridLines: const MajorGridLines(width: 1),
//       ),
//       primaryYAxis: NumericAxis(
//         // No fixed minimum or maximum - let the chart adjust automatically
//         title: AxisTitle(text: 'Price'), // Add Y-axis label
//         majorGridLines: const MajorGridLines(width: 1),
//       ),
//       axes: <ChartAxis>[
//         NumericAxis(
//           name: 'Y-Axis',
//           opposedPosition: true,
//           // No fixed maximum - let the chart adjust automatically
//           title: AxisTitle(text: 'Volume'), // Add secondary Y-axis label
//           isVisible: true, // Make the secondary Y-axis visible
//         )
//       ],
//       zoomPanBehavior: ZoomPanBehavior(
//         enablePinching: true, // Enable zoom on pinch
//         enablePanning: true, // Enable panning
//         zoomMode: ZoomMode.x, // Zoom only on the X-axis (time)
//       ),
//       trackballBehavior: TrackballBehavior(
//         enable: true, // Enable trackball
//         activationMode: ActivationMode.longPress, // Activate on long press
//       ),
//       series: <CartesianSeries>[
//         CandleSeries<MapEntry<String, dynamic>, DateTime>(
//           dataSource: timeSeriesData.entries.toList(),
//           xValueMapper: (data, _) => DateTime.parse(data.key),
//           openValueMapper: (data, _) => double.tryParse(data.value.open),
//           highValueMapper: (data, _) => double.tryParse(data.value.high),
//           lowValueMapper: (data, _) => double.tryParse(data.value.low),
//           closeValueMapper: (data, _) => double.tryParse(data.value.close),
//         ),
//         ColumnSeries<MapEntry<String, dynamic>, DateTime>(
//           yAxisName: 'Y-Axis', // Use the secondary Y-axis for volume
//           dataSource: timeSeriesData.entries.toList(),
//           xValueMapper: (data, _) => DateTime.parse(data.key),
//           yValueMapper: (data, _) => double.tryParse(data.value.volume),
//         ),
//       ],
//     );
//   }
// }
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
          dataSource: data.timeSeriesDaily?.entries.toList(),
          xValueMapper: (data, _) => DateTime.parse(data.key),
          openValueMapper: (data, _) => double.tryParse(data.value.open),
          highValueMapper: (data, _) => double.tryParse(data.value.high),
          lowValueMapper: (data, _) => double.tryParse(data.value.low),
          closeValueMapper: (data, _) => double.tryParse(data.value.close),
        ),
        ColumnSeries<MapEntry<String, DailyData>, DateTime>(
            yAxisName: 'Y-Axis',
            dataSource: data.timeSeriesDaily?.entries.toList(),
            xValueMapper: (data, _) => DateTime.parse(data.key),
            yValueMapper: (data, _) => double.tryParse(data.value.volume)),
      ],
    );
  }
}
