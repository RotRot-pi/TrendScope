import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:trendscope/domain/model/stock_data.dart';
import 'package:trendscope/domain/model/stocks_response.dart';

part 'app_mock_api.g.dart';

@RestApi(baseUrl: "http://10.0.2.2:8000/") //for mobile
// @RestApi(baseUrl: "http://127.0.0.1:8000/")
abstract class AppMockApi {
  factory AppMockApi(Dio dio, {String baseUrl}) = _AppMockApi;
  @GET("/query")
  Future<StockData> getHistoricalDataDaily(
    @Query("function") String function,
    @Query("symbol") String symbol,
  );

  // Similarly, update the return types for the other methods:
  @GET("/query")
  Future<StockData> getHistoricalDataWeekly(
    @Query("function") String function,
    @Query("symbol") String symbol,
  );

  @GET("/query")
  Future<StockData> getHistoricalDataMonthly(
    @Query("function") String function,
    @Query("symbol") String symbol,
  );

  @GET("/query")
  Future<StockData> getHistoricalDataYearly(
    @Query("function") String function,
    @Query("symbol") String symbol,
  );

  @GET("/query")
  Future<StockData> getHistoricalDataFiveYears(
    @Query("function") String function,
    @Query("symbol") String symbol,
  );

  @GET("/stocks")
  Future<StocksResponse> getStocks();
}
