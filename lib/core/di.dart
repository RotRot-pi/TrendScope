import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:trendscope/data/network/app_mock_api.dart';
import 'package:trendscope/data/repository/repository.dart';
import 'package:trendscope/domain/repository/repository.dart';
import 'package:trendscope/domain/usecases/get_historical_data.dart';

final instance = GetIt.instance;

void setup() {
  final Dio dio = Dio();
  instance.registerLazySingleton<AppMockApi>(() => AppMockApi(dio));

  instance.registerLazySingleton<Repository>(
      () => RepositoryImpl(dio: dio, appMockApi: instance()));

  instance.registerLazySingleton<GetHistoricalData>(
      () => GetHistoricalData(instance()));
}
