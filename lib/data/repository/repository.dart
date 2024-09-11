import 'package:dio/dio.dart';
import 'package:trendscope/data/network/app_mock_api.dart';
import 'package:trendscope/domain/model/stock_data.dart';
import 'package:trendscope/domain/model/stocks_response.dart';
import 'package:trendscope/domain/repository/repository.dart';
import 'package:trendscope/main.dart';

class RepositoryImpl implements Repository {
  final AppMockApi _appMockApi;

  RepositoryImpl({required Dio dio, required AppMockApi appMockApi})
      : _appMockApi = appMockApi;
  @override
  Future<StockData> getHistoricalDataDaily(String symbol) async {
    try {
      final response =
          await _appMockApi.getHistoricalDataDaily('TIME_SERIES_DAILY', symbol);
      appLogger.d("Daily response: $response");
      return response;
    } catch (e) {
      appLogger.e(e);
      throw Exception(e.toString());
      //     return Left(Failure(e.toString()));
    }
  }

  @override
  Future<StockData> getHistoricalDataWeekly(String symbol) async {
    try {
      final response = await _appMockApi.getHistoricalDataWeekly(
          'TIME_SERIES_WEEKLY', symbol);
      appLogger.d("Weekly response: $response");
      return response;
    } catch (e) {
      appLogger.e(e);
      throw Exception(e.toString());
      //     return Left(Failure(e.toString()));
    }
  }

  @override
  Future<StockData> getHistoricalDataMonthly(String symbol) async {
    try {
      final response = await _appMockApi.getHistoricalDataMonthly(
          'TIME_SERIES_MONTHLY', symbol);
      appLogger.d("Monthly response: $response");
      return response;
    } catch (e) {
      appLogger.e(e);
      throw Exception(e.toString());
      //     return Left(Failure(e.toString()));
    }
  }

  @override
  Future<StockData> getHistoricalDataYearly(String symbol) async {
    try {
      final response = await _appMockApi.getHistoricalDataYearly(
          'TIME_SERIES_YEARLY', symbol);
      appLogger.d("Yearly response: $response");
      return response;
    } catch (e) {
      appLogger.e(e);
      throw Exception(e.toString());
      //     return Left(Failure(e.toString()));
    }
  }

  @override
  Future<StockData> getHistoricalDataFiveYears(String symbol) async {
    try {
      final response = await _appMockApi.getHistoricalDataFiveYears(
          'TIME_SERIES_5YEAR', symbol);
      appLogger.d("5 Years response: $response");
      return response;
    } catch (e) {
      appLogger.e(e);
      throw Exception(e.toString());
      //     return Left(Failure(e.toString()));
    }
  }

  @override
  Future<StocksResponse> getStocks() {
    try {
      final response = _appMockApi.getStocks();
      return response;
    } catch (e) {
      appLogger.e(e);
      throw Exception(e.toString());
      //     return Left(Failure(e.toString()));
    }
  }
}
