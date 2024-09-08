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
  Future<StockData> getHistoricalData(String function, String symbol) async {
    try {
      final response = await _appMockApi.getHistoricalData(function, symbol);
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
