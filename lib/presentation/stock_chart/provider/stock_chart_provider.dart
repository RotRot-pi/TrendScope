import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trendscope/core/di.dart';
import 'package:trendscope/domain/model/stock_data.dart';
import 'package:trendscope/domain/usecases/get_historical_data_daily.dart';
import 'package:trendscope/domain/usecases/get_historical_data_five_years.dart';
import 'package:trendscope/domain/usecases/get_historical_data_monthly.dart';
import 'package:trendscope/domain/usecases/get_historical_data_weekly.dart';
import 'package:trendscope/domain/usecases/get_historical_data_yearly.dart';
// import 'package:trendscope/domain/usecases/get_historical_data.dart';
import 'package:trendscope/presentation/stock_chart/widgets/daily_stock_chart_widget.dart';
import 'package:trendscope/presentation/stock_chart/widgets/weekly_stock_chart_widget.dart';
import 'package:trendscope/presentation/stock_chart/widgets/monthly_stock_chart_widget.dart';
import 'package:trendscope/presentation/stock_chart/widgets/yearly_stock_chart_widget.dart';
import 'package:trendscope/presentation/stock_chart/widgets/five_years_stock_chart_widget.dart';

// // Providers for the chart widgets
// final dailyStockChartProvider = FutureProvider.family<Widget, String>(
//   (ref, symbol) async {
//     final dailyData =
//         await ref.read(getHistoricalDataDailyProvider).call(symbol);
//     return DailyStockChartWidget(data: dailyData);
//   },
// );

// final weeklyStockChartProvider = FutureProvider.family<Widget, String>(
//   (ref, symbol) async {
//     final weeklyData =
//         await ref.read(getHistoricalDataWeeklyProvider).call(symbol);
//     return WeeklyStockChartWidget(data: weeklyData);
//   },
// );

// final monthlyStockChartProvider = FutureProvider.family<Widget, String>(
//   (ref, symbol) async {
//     final monthlyData =
//         await ref.read(getHistoricalDataMonthlyProvider).call(symbol);
//     return MonthlyStockChartWidget(data: monthlyData);
//   },
// );

// final yearlyStockChartProvider = FutureProvider.family<Widget, String>(
//   (ref, symbol) async {
//     final yearlyData =
//         await ref.read(getHistoricalDataYearlyProvider).call(symbol);
//     return YearlyStockChartWidget(data: yearlyData);
//   },
// );

// final fiveYearsStockChartProvider = FutureProvider.family<Widget, String>(
//   (ref, symbol) async {
//     final fiveYearsData =
//         await ref.read(getHistoricalDataFiveYearsProvider).call(symbol);
//     return FiveYearsStockChartWidget(data: fiveYearsData);
//   },
// );

// // Providers for the Use Cases
// final getHistoricalDataDailyProvider = Provider<GetHistoricalDataDaily>(
//   (ref) => GetHistoricalDataDaily(instance()),
// );

// final getHistoricalDataWeeklyProvider = Provider<GetHistoricalDataWeekly>(
//   (ref) => GetHistoricalDataWeekly(instance()),
// );

// final getHistoricalDataMonthlyProvider = Provider<GetHistoricalDataMonthly>(
//   (ref) => GetHistoricalDataMonthly(instance()),
// );

// final getHistoricalDataYearlyProvider = Provider<GetHistoricalDataYearly>(
//   (ref) => GetHistoricalDataYearly(instance()),
// );

// final getHistoricalDataFiveYearsProvider = Provider<GetHistoricalDataFiveYears>(
//   (ref) => GetHistoricalDataFiveYears(instance()),
// );
// //Create stock chart provider using riverpod
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:trendscope/core/di.dart';
// import 'package:trendscope/domain/model/stock_data.dart';
// import 'package:trendscope/domain/usecases/get_historical_data_daily.dart';

// import 'package:trendscope/domain/usecases/get_historical_data_five_years.dart';
// import 'package:trendscope/domain/usecases/get_historical_data_monthly.dart';
// import 'package:trendscope/domain/usecases/get_historical_data_weekly.dart';
// import 'package:trendscope/domain/usecases/get_historical_data_yearly.dart';

// final selectedTimeRangeProvider =
//     StateProvider<String>((ref) => 'Daily'); // Default to Daily
// // Time Range-Specific Providers (Daily, Weekly, Monthly, Yearly, 5 Years)
// final stockChartDailyProvider = FutureProvider.family<DailyData, String>(
//   (ref, symbol) async {
//     return ref.read(getHistoricalDataDailyProvider).call(symbol);
//   },
// );

// final stockChartWeeklyProvider = FutureProvider.family<WeeklyData, String>(
//   (ref, symbol) async {
//     return ref.read(getHistoricalDataWeeklyProvider).call(symbol);
//   },
// );

// final stockChartMonthlyProvider = FutureProvider.family<MonthlyData, String>(
//   (ref, symbol) async {
//     return ref.read(getHistoricalDataMonthlyProvider).call(symbol);
//   },
// );

// final stockChartYearlyProvider = FutureProvider.family<YearlyData, String>(
//   (ref, symbol) async {
//     return ref.read(getHistoricalDataYearlyProvider).call(symbol);
//   },
// );

// final stockChart5YearProvider = FutureProvider.family<FiveYearsData, String>(
//   (ref, symbol) async {
//     return ref.read(getHistoricalData5YearProvider).call(symbol);
//   },
// );

// // Providers for the Use Cases
// final getHistoricalDataDailyProvider = Provider<GetHistoricalDataDaily>(
//   (ref) => GetHistoricalDataDaily(instance()),
// );

// final getHistoricalDataWeeklyProvider = Provider<GetHistoricalDataWeekly>(
//   (ref) => GetHistoricalDataWeekly(instance()),
// );

// final getHistoricalDataMonthlyProvider = Provider<GetHistoricalDataMonthly>(
//   (ref) => GetHistoricalDataMonthly(instance()),
// );

// final getHistoricalDataYearlyProvider = Provider<GetHistoricalDataYearly>(
//   (ref) => GetHistoricalDataYearly(instance()),
// );

// final getHistoricalData5YearProvider = Provider<GetHistoricalDataFiveYears>(
//   (ref) => GetHistoricalDataFiveYears(instance()),
// );
//stock chart provider
//the provider will get the data from the repository
//i need the stock data time series for the date
//and the daily data for the prices and volume

final stockChartProvider = FutureProvider.family<StockData, String>(
  (ref, symbol) async {
    return ref.read(getHistoricalDataDailyProvider).call(symbol);
  },
);

final getHistoricalDataDailyProvider = Provider<GetHistoricalDataWeekly>(
  (ref) => GetHistoricalDataWeekly(
    instance(),
  ),
);
