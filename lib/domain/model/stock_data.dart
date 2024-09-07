// import 'package:freezed_annotation/freezed_annotation.dart';
// part 'stock_data.freezed.dart';
// part 'stock_data.g.dart';

// @freezed
// class StockData with _$StockData {
//   const factory StockData({
//     required DateTime date,
//     required double openPrice,
//     required double highPrice,
//     required double lowPrice,
//     required double closePrice,
//   }) = _StockData;

//   factory StockData.fromJson(Map<String, dynamic> json, String date) =>
//       _$StockDataFromJson(json, date);
// }
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stock_data.freezed.dart';
part 'stock_data.g.dart';

@freezed
class StockData with _$StockData {
  const factory StockData({
    required MetaData metaData,
    required Map<String, DailyData> timeSeriesDaily,
    // ... (Add other time series data as needed)
  }) = _StockData;

  factory StockData.fromJson(Map<String, dynamic> json) =>
      _$StockDataFromJson(json);
}

@freezed
class MetaData with _$MetaData {
  const factory MetaData({
    required String information,
    required String symbol,
    required String lastRefreshed,
    required String outputSize,
    required String timeZone,
  }) = _MetaData;

  factory MetaData.fromJson(Map<String, dynamic> json) =>
      _$MetaDataFromJson(json);
}

@freezed
class DailyData with _$DailyData {
  const factory DailyData({
    required String open,
    required String high,
    required String low,
    required String close,
    required String volume,
  }) = _DailyData;

  factory DailyData.fromJson(Map<String, dynamic> json) =>
      _$DailyDataFromJson(json);
}
