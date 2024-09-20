import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trendscope/core/di.dart';
import 'package:trendscope/domain/model/stocks_response.dart';
import 'package:trendscope/domain/usecases/get_stocks.dart';
import 'package:trendscope/domain/usecases/get_top_movers.dart';

final marketDataProvider = FutureProvider<List<Stock>>((ref) async {
  final stocksResponse =
      await ref.read(getStocks).call(); // Get the StocksResponse
  final activeButton = ref.watch(activeTopMoversButtonProvider);
  final topMoversData =
      await ref.read(getTopMoversDataProvider).call(); // Get the TopMoversData

  switch (activeButton) {
    case 'Top Gainers':
      return stocksResponse.stocks
          .where((stock) => topMoversData.topGainers
              .any((gainer) => gainer.ticker == stock.symbol))
          .toList();
    case 'Top Losers':
      return stocksResponse.stocks
          .where((stock) => topMoversData.topLosers
              .any((loser) => loser.ticker == stock.symbol))
          .toList();
    case 'Most Actively Traded':
      return stocksResponse.stocks
          .where((stock) => topMoversData.mostActivelyTraded
              .any((active) => active.ticker == stock.symbol))
          .toList();
    default:
      return stocksResponse.stocks; // Return all stocks
  }
});

final getStocks = Provider<GetStocks>(
  (ref) => GetStocks(instance()),
);

final activeTopMoversButtonProvider =
    StateProvider<String>((ref) => 'Top Gainers');
final getTopMoversDataProvider =
    Provider<GetTopMoversData>((ref) => GetTopMoversData(instance()));
