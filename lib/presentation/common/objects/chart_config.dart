import 'package:intl/intl.dart';

class ChartConfig {
  final DateTime minimumDate;
  final DateTime maximumDate;
  final double minPrice;
  final double maxPrice;
  final DateFormat dateFormat;

  ChartConfig({
    required this.minimumDate,
    required this.maximumDate,
    required this.minPrice,
    required this.maxPrice,
    required this.dateFormat,
  });
}
