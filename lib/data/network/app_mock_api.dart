import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:trendscope/core/constant.dart';
import 'package:trendscope/domain/model/best_matches.dart';
import 'package:trendscope/domain/model/stock_data.dart';
import 'package:trendscope/domain/model/stocks_response.dart';
import 'package:trendscope/domain/model/top_movers_data.dart';
import 'package:trendscope/main.dart';
import 'package:logger/logger.dart' as logmessage;

part 'app_mock_api.g.dart';

// @RestApi(baseUrl: "http://10.0.2.2:8000/") //for mobile
// @RestApi(baseUrl: "http://127.0.0.1:8000/") // for local server
@RestApi(baseUrl: alphaVantageUrl)
abstract class AppMockApi {
  factory AppMockApi(Dio dio, {String baseUrl}) = _AppMockApi;
  @GET("/query")
  Future<StockData> getHistoricalData(
    @Query("function") String function,
    @Query("symbol") String symbol,
  );

  // @GET("/stocks")
  // Future<StocksResponse> getStocks();

  // Add new method for fetching top movers data
  @GET("/query")
  Future<TopMoversData> getTopMoversData({
    @Query("function") required String function,
    @Query("apikey") required String apiKey,
  });

// Add new method for SYMBOL SEARCH
  @GET("/query")
  Future<BestMatches> searchSymbol({
    @Query("function") required String function,
    @Query("keywords") required String keywords,
    @Query("apikey") required String apiKey,
  });
}
