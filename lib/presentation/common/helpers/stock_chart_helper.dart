import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:trendscope/core/enums.dart';
import 'package:trendscope/domain/model/stock_data.dart';
import 'package:trendscope/presentation/common/objects/chart_data_object.dart';

class StockChartHelpers {
  static List<ChartData> processChartData(
      StockData stockData, ChartTimeFrame timeFrame) {
    // Switch between different time series based on the selected timeframe
    Map<String, dynamic>? timeSeries;
    switch (timeFrame) {
      case ChartTimeFrame.daily:
        timeSeries = stockData.timeSeriesDaily;
        break;
      case ChartTimeFrame.weekly:
        timeSeries = stockData.timeSeriesWeekly;
        break;
      case ChartTimeFrame.monthly:
        timeSeries = stockData.timeSeriesMonthly;
        break;
      case ChartTimeFrame.yearly:
        timeSeries = stockData.timeSeriesYearly;
        break;
      case ChartTimeFrame.fiveYears:
        timeSeries = stockData.timeSeriesFiveYears;
        break;
    }
    // If there's no data available for the selected timeframe, return an empty list
    if (timeSeries == null || timeSeries.isEmpty) {
      return [];
    }

    // Sort the time series entries by date in descending order
    var sortedEntries = timeSeries.entries.toList()
      ..sort((a, b) => b.key.compareTo(a.key));

    // If sorted entries are empty, return an empty list
    if (sortedEntries.isEmpty) return [];

    // Map each entry to ChartData, parsing the date and other values
    return sortedEntries.map((entry) {
      final date = DateFormat('yyyy-MM-dd').parse(entry.key);
      final data = entry.value;
      return ChartData(
        date: date,
        open: double.tryParse(data.open) ?? 0,
        high: double.tryParse(data.high) ?? 0,
        low: double.tryParse(data.low) ?? 0,
        close: double.tryParse(data.close) ?? 0,
        volume: double.tryParse(data.volume) ?? 0,
      );
    }).toList();
  }

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

  static double getRangeSelectorInterval(ChartTimeFrame timeframe) {
    switch (timeframe) {
      case ChartTimeFrame.daily:
        return 1.0; // 1 day interval
      case ChartTimeFrame.weekly:
        return 7.0; // 7 days interval
      case ChartTimeFrame.monthly:
        return 30.0; // Approximately 1 month interval
      case ChartTimeFrame.yearly:
        return 365.0; // 1 year interval
      case ChartTimeFrame.fiveYears:
        return 365.0 * 5; // 5 years interval
    }
  }

  static DateIntervalType getDateIntervalType(ChartTimeFrame timeframe) {
    switch (timeframe) {
      case ChartTimeFrame.daily:
      case ChartTimeFrame.weekly:
        return DateIntervalType.days;
      case ChartTimeFrame.monthly:
        return DateIntervalType.months;
      case ChartTimeFrame.yearly:
      case ChartTimeFrame.fiveYears:
        return DateIntervalType.years;
    }
  }

  static List<String> getValidPeriods(ChartTimeFrame timeframe) {
    switch (timeframe) {
      case ChartTimeFrame.daily:
        return [
          'Last Day',
          'Last Week',
          'Last Month',
          'Last 3 Months',
          'Last 6 Months',
          'Last Year',
          '5 Years'
        ];
      case ChartTimeFrame.weekly:
        return [
          'Last Week',
          'Last Month',
          'Last 3 Months',
          'Last 6 Months',
          'Last Year',
          '5 Years'
        ];
      case ChartTimeFrame.monthly:
        return [
          'Last Month',
          'Last 3 Months',
          'Last 6 Months',
          'Last Year',
          '5 Years'
        ];
      case ChartTimeFrame.yearly:
        return ['Last Year', '5 Years'];
      case ChartTimeFrame.fiveYears:
        return ['5 Years'];
      default:
        return [
          'Last Day',
          'Last Week',
          'Last Month',
          'Last 3 Months',
          'Last 6 Months',
          'Last Year',
          '5 Years'
        ];
    }
  }
}
