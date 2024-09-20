import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart' as intl;

part 'top_movers_data.freezed.dart';
part 'top_movers_data.g.dart';

@freezed
class TopMoversData with _$TopMoversData {
  const factory TopMoversData({
    required String metadata,
    required DateTime lastUpdated,
    required List<TopMoverStock> topGainers,
    required List<TopMoverStock> topLosers,
    required List<TopMoverStock> mostActivelyTraded,
  }) = _TopMoversData;

  factory TopMoversData.fromJson(Map<String, dynamic> json) =>
      _$TopMoversDataFromJson(json);
}

@freezed
class TopMoverStock with _$TopMoverStock {
  const factory TopMoverStock({
    required String ticker,
    required double price, // Use double instead of String for price
    required double changeAmount, // Use double instead of String
    required String changePercentage,
    required int volume,
  }) = _TopMoverStock;

  factory TopMoverStock.fromJson(Map<String, dynamic> json) =>
      _$TopMoverStockFromJson(json);
}
