// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:intl/intl.dart';

class ChartConfig {
  final DateTime minimumDate;
  final DateTime maximumDate;
  final double minPrice;
  final double maxPrice;
  final double maxVolume;
  final double minVolume;
  final DateFormat dateFormat;

  ChartConfig({
    required this.minimumDate,
    required this.maximumDate,
    required this.minPrice,
    required this.maxPrice,
    required this.maxVolume,
    required this.minVolume,
    required this.dateFormat,
  });
}
