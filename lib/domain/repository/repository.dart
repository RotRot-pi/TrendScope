//Domain Layer Repository

import 'package:dartz/dartz.dart';
import 'package:trendscope/data/network/failure.dart';
import 'package:trendscope/domain/model/stock_data.dart';

abstract class Repository {
  Future<StockData> getHistoricalData(String function, String symbol);
}
