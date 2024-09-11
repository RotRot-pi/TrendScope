import 'package:freezed_annotation/freezed_annotation.dart';

part 'stock_data.freezed.dart';
part 'stock_data.g.dart';

// Create a new class to hold the MetaData and TimeSeries
@freezed
class StockData with _$StockData {
  const factory StockData({
    required MetaData metaData,
    Map<String, DailyData>? timeSeriesDaily,
    Map<String, WeeklyData>? timeSeriesWeekly,
    Map<String, MonthlyData>? timeSeriesMonthly,
    Map<String, YearlyData>? timeSeriesYearly,
    Map<String, FiveYearsData>? timeSeriesFiveYears,
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

// Similarly add the 'date' field to WeeklyData, MonthlyData, etc.

@freezed
class WeeklyData with _$WeeklyData {
  const factory WeeklyData({
    required String open,
    required String high,
    required String low,
    required String close,
    required String volume,
  }) = _WeeklyData;

  factory WeeklyData.fromJson(Map<String, dynamic> json) =>
      _$WeeklyDataFromJson(json);
}

@freezed
class MonthlyData with _$MonthlyData {
  const factory MonthlyData({
    required String open,
    required String high,
    required String low,
    required String close,
    required String volume,
  }) = _MonthlyData;

  factory MonthlyData.fromJson(Map<String, dynamic> json) =>
      _$MonthlyDataFromJson(json);
}

@freezed
class YearlyData with _$YearlyData {
  const factory YearlyData({
    required String open,
    required String high,
    required String low,
    required String close,
    required String volume,
  }) = _YearlyData;

  factory YearlyData.fromJson(Map<String, dynamic> json) =>
      _$YearlyDataFromJson(json);
}

@freezed
class FiveYearsData with _$FiveYearsData {
  const factory FiveYearsData({
    required String open,
    required String high,
    required String low,
    required String close,
    required String volume,
  }) = _FiveYearsData;

  factory FiveYearsData.fromJson(Map<String, dynamic> json) =>
      _$FiveYearsDataFromJson(json);
}
