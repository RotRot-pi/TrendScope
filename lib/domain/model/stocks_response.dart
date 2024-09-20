import 'package:freezed_annotation/freezed_annotation.dart';
part 'stocks_response.freezed.dart';
part 'stocks_response.g.dart';

// @freezed
// class Stock with _$Stock {
//   const factory Stock({
//     required String symbol,
//     required String companyName,
//     required String exchange,
//     required String currentPrice,
//     required String percentageChange,
//     required String logoUrl,
//     required DateTime lastUpdated,
//   }) = _Stock;

//   factory Stock.fromJson(Map<String, dynamic> json) => _$StockFromJson(json);
// }
@freezed
class Stock with _$Stock {
  const factory Stock({
    required String symbol,
    required String companyName,
    required String exchange,
    required String currency, // Add currency
    required String type, // Add type (e.g., Equity)
    required String region, // Add region
    required String currentPrice,
    required String percentageChange,
    required String logoUrl,
    required DateTime lastUpdated,
  }) = _Stock;

  factory Stock.fromJson(Map<String, dynamic> json) => _$StockFromJson(json);
}

@freezed
class StocksResponse with _$StocksResponse {
  const factory StocksResponse({
    required List<Stock> stocks,
  }) = _StocksResponse;

  factory StocksResponse.fromJson(Map<String, dynamic> json) =>
      _$StocksResponseFromJson(json);
}
