//use case : get_stocks
import 'package:trendscope/domain/model/stocks_response.dart';
import 'package:trendscope/domain/repository/repository.dart';

class GetStocks {
  final Repository _repository;
  GetStocks(this._repository);

  Future<StocksResponse> call() async {
    return await _repository.getStocks();
  }
}
