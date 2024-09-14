import 'package:freezed_annotation/freezed_annotation.dart';

part 'stock_data.freezed.dart';
part 'stock_data.g.dart';

// Create a new class to hold the MetaData and TimeSeries
@freezed
class StockData with _$StockData {
  const factory StockData({
    required MetaData metaData,
    Map<String, TimeSeriesData>? timeSeriesDaily,
    Map<String, TimeSeriesData>? timeSeriesWeekly,
    Map<String, TimeSeriesData>? timeSeriesMonthly,
    Map<String, TimeSeriesData>? timeSeriesYearly,
    Map<String, TimeSeriesData>? timeSeriesFiveYears,
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
class TimeSeriesData with _$TimeSeriesData {
  const factory TimeSeriesData({
    required String open,
    required String high,
    required String low,
    required String close,
    required String volume,
  }) = _TimeSeriesData;

  factory TimeSeriesData.fromJson(Map<String, dynamic> json) =>
      _$TimeSeriesDataFromJson(json);
}
