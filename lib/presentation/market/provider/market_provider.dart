import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trendscope/core/di.dart';
import 'package:trendscope/domain/model/stocks_response.dart';
import 'package:trendscope/domain/usecases/get_stocks.dart';

final marketDataProvider = FutureProvider<StocksResponse>(
  (ref) async {
    return ref.read(getStocks).call();
  },
);

final getStocks = Provider<GetStocks>(
  (ref) => GetStocks(instance()),
);
