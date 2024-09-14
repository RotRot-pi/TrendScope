import 'package:intl/intl.dart';
import 'package:trendscope/core/enums.dart';

class StockChartHelpers {
  static (DateTime, DateTime) calculateMinimumDate(
      DateTime maximumDate, DateTime minimumDate, String selectedPeriod) {
    switch (selectedPeriod) {
      case 'Last Day':
        minimumDate = maximumDate.subtract(const Duration(days: 1));
        break;
      case 'Last Week':
        minimumDate = maximumDate.subtract(const Duration(days: 7));
        break;
      case 'Last Month':
        minimumDate = maximumDate.subtract(const Duration(days: 30));
        break;
      case 'Last 3 Months':
        minimumDate = maximumDate.subtract(const Duration(days: 90));
        break;
      case 'Last 6 Months':
        minimumDate = maximumDate.subtract(const Duration(days: 180));
        break;
      case 'Last Year':
        minimumDate = maximumDate.subtract(const Duration(days: 365));
        break;
      case '5 Years':
        minimumDate = maximumDate.subtract(const Duration(days: 1825));
        break;
      default:
        minimumDate = maximumDate.subtract(const Duration(days: 1));
        break;
    }
    return (minimumDate, maximumDate);
  }

  static Duration getDateTimePadding(ChartTimeFrame selectedTimeFrame) {
    var dateTimePadding = const Duration(days: 1);
    switch (selectedTimeFrame) {
      case ChartTimeFrame.daily:
        dateTimePadding = const Duration(hours: 12);
        break;
      case ChartTimeFrame.weekly:
        dateTimePadding = const Duration(days: 3);
        break;
      case ChartTimeFrame.monthly:
        dateTimePadding = const Duration(days: 15);
        break;
      case ChartTimeFrame.yearly:
        dateTimePadding = const Duration(days: 182);
        break;
      case ChartTimeFrame.fiveYears:
        dateTimePadding = const Duration(days: 910);
        break;
    }

    return dateTimePadding;
  }

  static DateFormat getDateFormat(ChartTimeFrame selectedTimeFrame) {
    switch (selectedTimeFrame) {
      case ChartTimeFrame.daily:
        return DateFormat('MMMEd');
      case ChartTimeFrame.weekly:
        return DateFormat('MMMEd');
      case ChartTimeFrame.monthly:
        return DateFormat('MMM yyyy');
      case ChartTimeFrame.yearly:
        return DateFormat('yyyy');
      case ChartTimeFrame.fiveYears:
        return DateFormat('yyyy');
    }
  }
}
