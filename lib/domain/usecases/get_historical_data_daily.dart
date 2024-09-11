//use case : get_historical_data
import 'package:trendscope/domain/model/stock_data.dart';
import 'package:trendscope/domain/repository/repository.dart';

class GetHistoricalDataDaily {
  final Repository _repository;
  GetHistoricalDataDaily(this._repository);

  Future<StockData> call(String symbol) async {
    return await _repository.getHistoricalDataDaily(symbol);
  }
}
