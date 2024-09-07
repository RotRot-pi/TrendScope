// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StockDataImpl _$$StockDataImplFromJson(Map<String, dynamic> json) =>
    _$StockDataImpl(
      metaData: MetaData.fromJson(json['Meta Data'] as Map<String, dynamic>),
      timeSeriesDaily:
          (json['Time Series (Daily)'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, DailyData.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$$StockDataImplToJson(_$StockDataImpl instance) =>
    <String, dynamic>{
      'metaData': instance.metaData,
      'timeSeriesDaily': instance.timeSeriesDaily,
    };

_$MetaDataImpl _$$MetaDataImplFromJson(Map<String, dynamic> json) =>
    _$MetaDataImpl(
      information: json['1. Information'] ?? '0.0' as String,
      symbol: json['2. Symbol'] ?? '0.0' as String,
      lastRefreshed: json['3. Last Refreshed'] ?? '0.0' as String,
      outputSize: json['4 Output Size'] ?? '0.0' as String,
      timeZone: json['5. Time Zone'] ?? '0.0' as String,
    );

Map<String, dynamic> _$$MetaDataImplToJson(_$MetaDataImpl instance) =>
    <String, dynamic>{
      'information': instance.information,
      'symbol': instance.symbol,
      'lastRefreshed': instance.lastRefreshed,
      'outputSize': instance.outputSize,
      'timeZone': instance.timeZone,
    };

_$DailyDataImpl _$$DailyDataImplFromJson(Map<String, dynamic> json) =>
    _$DailyDataImpl(
      open: json['1. open'] ?? '0.0' as String,
      high: json['2. high'] ?? '0.0' as String,
      low: json['3. low'] ?? '0.0' as String,
      close: json['4. close'] ?? '0.0' as String,
      volume: json['5. volume'] ?? '0.0' as String,
    );

Map<String, dynamic> _$$DailyDataImplToJson(_$DailyDataImpl instance) =>
    <String, dynamic>{
      'open': instance.open,
      'high': instance.high,
      'low': instance.low,
      'close': instance.close,
      'volume': instance.volume,
    };
