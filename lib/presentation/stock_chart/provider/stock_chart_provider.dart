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

// Provider for Selected Symbol
final selectedSymbolProvider = StateProvider<String>((ref) => 'AAPL');

// Provider for selected stock symbols (for comparison)
final selectedSymbolsProvider = StateProvider<List<String>>((ref) => ['AAPL']);

// Provider for stock chart data
final stockChartDataProvider =
    FutureProvider.family<List<StockData>, ChartTimeFrame>(
        (ref, timeframe) async {
  final selectedSymbol = ref.watch(selectedSymbolProvider);
  // Get the multi-selected symbols
  final selectedSymbols = ref.watch(selectedSymbolsProvider);

  // Determine which symbols to use based on the context
  final symbolsToFetch =
      selectedSymbols.isEmpty ? [selectedSymbol] : selectedSymbols;
  // final symbols = ref.watch(selectedSymbolsProvider);
  try {
    switch (timeframe) {
      case ChartTimeFrame.daily:
        return Future.wait(symbolsToFetch
            .map((symbol) =>
                ref.read(getHistoricalDataDailyProvider).call(symbol))
            .toList());
      case ChartTimeFrame.weekly:
        return Future.wait(symbolsToFetch
            .map((symbol) =>
                ref.read(getHistoricalDataWeeklyProvider).call(symbol))
            .toList());
      case ChartTimeFrame.monthly:
        return Future.wait(symbolsToFetch
            .map((symbol) =>
                ref.read(getHistoricalDataMonthlyProvider).call(symbol))
            .toList());
      case ChartTimeFrame.yearly:
        return Future.wait(symbolsToFetch
            .map((symbol) =>
                ref.read(getHistoricalDataYearlyProvider).call(symbol))
            .toList());
      case ChartTimeFrame.fiveYears:
        return Future.wait(symbolsToFetch
            .map((symbol) =>
                ref.read(getHistoricalDataFiveYearsProvider).call(symbol))
            .toList());
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
