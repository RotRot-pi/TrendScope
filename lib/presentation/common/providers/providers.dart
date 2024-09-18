// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:trendscope/domain/model/stocks_response.dart';
// import 'package:trendscope/presentation/market/provider/market_provider.dart';
// import 'package:trendscope/presentation/stock_chart/provider/stock_chart_provider.dart';

// final stocksProvider = StateProvider<StocksResponse?>((ref) {
//   return ref.watch(marketDataProvider).hasValue
//       ? ref.watch(marketDataProvider).asData!.value
//       : null;
// });

// final remainingStocksProvider = StateProvider<List<Stock>?>((ref) {
//   final stocks = ref.watch(stocksProvider)?.stocks ?? [];
//   final selectedStock = ref.watch(selectedSymbolProvider);
//   return stocks.where((item) => item.symbol != selectedStock).toList();
// });
