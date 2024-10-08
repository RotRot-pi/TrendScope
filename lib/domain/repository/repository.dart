//Domain Layer Repository
import 'package:trendscope/domain/model/stock_data.dart';
import 'package:trendscope/domain/model/stocks_response.dart';

abstract class Repository {
  Future<StockData> getHistoricalDataDaily(String symbol);

  Future<StockData> getHistoricalDataWeekly(String symbol);

  Future<StockData> getHistoricalDataMonthly(String symbol);

  Future<StockData> getHistoricalDataYearly(String symbol);

  Future<StockData> getHistoricalDataFiveYears(String symbol);

  Future<StocksResponse> getStocks();
}
