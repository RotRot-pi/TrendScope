import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:trendscope/data/network/app_mock_api.dart';
import 'package:trendscope/data/repository/repository.dart';
import 'package:trendscope/domain/repository/repository.dart';
import 'package:trendscope/domain/usecases/get_historical_data_daily.dart';
import 'package:trendscope/domain/usecases/get_historical_data_five_years.dart';
import 'package:trendscope/domain/usecases/get_historical_data_monthly.dart';
import 'package:trendscope/domain/usecases/get_historical_data_weekly.dart';
import 'package:trendscope/domain/usecases/get_historical_data_yearly.dart';
import 'package:trendscope/domain/usecases/get_stocks.dart';
import 'package:trendscope/domain/usecases/get_top_movers.dart';

final instance = GetIt.instance;

setup() {
  final Dio dio = Dio();
  instance.registerLazySingleton<AppMockApi>(() => AppMockApi(dio));

  instance.registerLazySingleton<Repository>(
      () => RepositoryImpl(dio: dio, appMockApi: instance()));

  instance.registerLazySingleton<GetHistoricalDataDaily>(
      () => GetHistoricalDataDaily(instance()));

  instance.registerLazySingleton<GetHistoricalDataWeekly>(
      () => GetHistoricalDataWeekly(instance()));

  instance.registerLazySingleton<GetHistoricalDataMonthly>(
      () => GetHistoricalDataMonthly(instance()));

  instance.registerLazySingleton<GetHistoricalDataYearly>(
      () => GetHistoricalDataYearly(instance()));

  instance.registerLazySingleton<GetHistoricalDataFiveYears>(
      () => GetHistoricalDataFiveYears(instance()));

  instance.registerLazySingleton<GetStocks>(() => GetStocks(instance()));

  instance.registerLazySingleton<GetTopMoversData>(
      () => GetTopMoversData(instance()));
}
