import 'package:trendscope/domain/model/top_movers_data.dart';
import 'package:trendscope/domain/repository/repository.dart';

class GetTopMoversData {
  final Repository _repository;

  GetTopMoversData(this._repository);

  Future<TopMoversData> call() async {
    return await _repository.getTopMoversData();
  }
}
