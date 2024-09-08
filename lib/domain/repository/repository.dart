//Domain Layer Repository
import 'package:trendscope/domain/model/stock_data.dart';
import 'package:trendscope/domain/model/stocks_response.dart';

abstract class Repository {
  Future<StockData> getHistoricalData(String function, String symbol);

  Future<StocksResponse> getStocks();
}
