// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StockDataImpl _$$StockDataImplFromJson(Map<String, dynamic> json) =>
    _$StockDataImpl(
      metaData: MetaData.fromJson(json['Meta Data'] as Map<String, dynamic>),
      timeSeriesDaily:
          (json['Time Series (Daily)'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, TimeSeriesData.fromJson(e as Map<String, dynamic>)),
      ),
      timeSeriesWeekly:
          (json['Time Series (Weekly)'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, TimeSeriesData.fromJson(e as Map<String, dynamic>)),
      ),
      timeSeriesMonthly:
          (json['Time Series (Monthly)'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, TimeSeriesData.fromJson(e as Map<String, dynamic>)),
      ),
      timeSeriesYearly:
          (json['Time Series (Yearly)'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, TimeSeriesData.fromJson(e as Map<String, dynamic>)),
      ),
      timeSeriesFiveYears:
          (json['Time Series (5 Years)'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, TimeSeriesData.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$$StockDataImplToJson(_$StockDataImpl instance) =>
    <String, dynamic>{
      'metaData': instance.metaData,
      'timeSeriesDaily': instance.timeSeriesDaily,
      'timeSeriesWeekly': instance.timeSeriesWeekly,
      'timeSeriesMonthly': instance.timeSeriesMonthly,
      'timeSeriesYearly': instance.timeSeriesYearly,
      'timeSeriesFiveYears': instance.timeSeriesFiveYears,
    };

_$MetaDataImpl _$$MetaDataImplFromJson(Map<String, dynamic> json) =>
    _$MetaDataImpl(
      information: json['1. Information'] as String? ?? '',
      symbol: json['2. Symbol'] as String? ?? '',
      lastRefreshed: json['3. Last Refreshed'] as String? ?? '',
      outputSize: json['4. Output Size'] as String? ?? '',
      timeZone: json['5. Time Zone'] as String? ?? '',
    );

Map<String, dynamic> _$$MetaDataImplToJson(_$MetaDataImpl instance) =>
    <String, dynamic>{
      'information': instance.information,
      'symbol': instance.symbol,
      'lastRefreshed': instance.lastRefreshed,
      'outputSize': instance.outputSize,
      'timeZone': instance.timeZone,
    };

_$TimeSeriesDataImpl _$$TimeSeriesDataImplFromJson(Map<String, dynamic> json) =>
    _$TimeSeriesDataImpl(
      open: json['1. open'] as String? ?? '',
      high: json['2. high'] as String? ?? '',
      low: json['3. low'] as String? ?? '',
      close: json['4. close'] as String? ?? '',
      volume: json['5. volume'] as String? ?? '',
    );

Map<String, dynamic> _$$TimeSeriesDataImplToJson(
        _$TimeSeriesDataImpl instance) =>
    <String, dynamic>{
      'open': instance.open,
      'high': instance.high,
      'low': instance.low,
      'close': instance.close,
      'volume': instance.volume,
    };
