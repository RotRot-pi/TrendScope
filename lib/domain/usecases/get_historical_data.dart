//use case : get_historical_data
import 'package:dartz/dartz.dart';
import 'package:trendscope/data/network/failure.dart';
import 'package:trendscope/domain/model/stock_data.dart';
import 'package:trendscope/domain/repository/repository.dart';

class GetHistoricalData {
  final Repository _repository;
  GetHistoricalData(this._repository);

  Future<Either<Failure, StockData>> call(
      String function, String symbol) async {
    return await _repository.getHistoricalData(function, symbol);
  }
}
