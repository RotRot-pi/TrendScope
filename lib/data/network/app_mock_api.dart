import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:trendscope/domain/model/stock_data.dart';
import 'package:trendscope/domain/model/stocks_response.dart';

part 'app_mock_api.g.dart';

@RestApi(baseUrl: "http://10.0.2.2:8000/")
abstract class AppMockApi {
  factory AppMockApi(Dio dio, {String baseUrl}) = _AppMockApi;

  @GET("/query")
  Future<StockData> getHistoricalData(
    @Query("function") String function,
    @Query("symbol") String symbol,
    // @Query("apikey") String apiKey,
  );

  @GET("/stocks")
  Future<StocksResponse> getStocks();
}
