import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:trendscope/core/constant.dart';
import 'package:trendscope/core/di.dart';
import 'package:trendscope/core/enums.dart';
import 'package:trendscope/domain/model/stock_data.dart';
import 'package:trendscope/domain/usecases/get_historical_data_daily.dart';
import 'package:trendscope/domain/usecases/get_historical_data_five_years.dart';
import 'package:trendscope/domain/usecases/get_historical_data_monthly.dart';
import 'package:trendscope/domain/usecases/get_historical_data_weekly.dart';
import 'package:trendscope/domain/usecases/get_historical_data_yearly.dart';
import 'package:trendscope/main.dart';

// Add a provider for the selected chart type
final selectedChartTypeProvider = StateProvider<String>(
  (ref) => 'Candlestick', // Default chart type
);

// Provider for trendline visibility (using a family for each type)
final trendlineVisibilityProvider = StateProvider.family<bool, TrendlineType>(
  (ref, type) => false, // Initially, all trendlines are hidden
);

// Add a StateProvider to control trendline visibility
final showTrendlineProvider = StateProvider<bool>((ref) => false);
// Add a StateProvider to control open/close marker visibility
final showOpenCloseMarkesProvider = StateProvider<bool>((ref) => false);
// Add a StateProvider to store the selected period
final selectedPeriodProvider = StateProvider<String>((ref) => periods.last);

// Provider for Selected Timeframe
final selectedTimeFrameProvider =
    StateProvider<ChartTimeFrame>((ref) => ChartTimeFrame.daily);

// Provider for Chart Data (replace with your actual API call)
final stockChartDataProvider =
    FutureProvider.family<StockData, (String, ChartTimeFrame)>(
        (ref, params) async {
  final (symbol, timeframe) = params;
  try {
    switch (timeframe) {
      case ChartTimeFrame.daily:
        return ref.read(getHistoricalDataDailyProvider).call(symbol);
      case ChartTimeFrame.weekly:
        return ref.read(getHistoricalDataWeeklyProvider).call(symbol);
      case ChartTimeFrame.monthly:
        return ref.read(getHistoricalDataMonthlyProvider).call(symbol);
      case ChartTimeFrame.yearly:
        return ref.read(getHistoricalDataYearlyProvider).call(symbol);
      case ChartTimeFrame.fiveYears:
        return ref.read(getHistoricalDataFiveYearsProvider).call(symbol);
    }
  } catch (e) {
    appLogger.d('Error fetching stock data: $e');
    rethrow;
  }
});
// get historical data
final getHistoricalDataDailyProvider = Provider<GetHistoricalDataDaily>(
  (ref) => GetHistoricalDataDaily(
    instance(),
  ),
);

final getHistoricalDataWeeklyProvider = Provider<GetHistoricalDataWeekly>(
  (ref) => GetHistoricalDataWeekly(
    instance(),
  ),
);

final getHistoricalDataMonthlyProvider = Provider<GetHistoricalDataMonthly>(
  (ref) => GetHistoricalDataMonthly(
    instance(),
  ),
);

final getHistoricalDataYearlyProvider =
    Provider<GetHistoricalDataYearly>((ref) => GetHistoricalDataYearly(
          instance(),
        ));

final getHistoricalDataFiveYearsProvider =
    Provider<GetHistoricalDataFiveYears>((ref) => GetHistoricalDataFiveYears(
          instance(),
        ));
