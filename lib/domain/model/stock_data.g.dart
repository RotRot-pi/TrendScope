// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StockDataImpl _$$StockDataImplFromJson(Map<String, dynamic> json) =>
    _$StockDataImpl(
      metaData: MetaData.fromJson(json['metaData'] as Map<String, dynamic>),
      timeSeriesDaily: (json['timeSeriesDaily'] as Map<String, dynamic>).map(
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
      information: json['information'] as String,
      symbol: json['symbol'] as String,
      lastRefreshed: json['lastRefreshed'] as String,
      outputSize: json['outputSize'] as String,
      timeZone: json['timeZone'] as String,
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
      open: json['open'] as String,
      high: json['high'] as String,
      low: json['low'] as String,
      close: json['close'] as String,
      volume: json['volume'] as String,
    );

Map<String, dynamic> _$$DailyDataImplToJson(_$DailyDataImpl instance) =>
    <String, dynamic>{
      'open': instance.open,
      'high': instance.high,
      'low': instance.low,
      'close': instance.close,
      'volume': instance.volume,
    };
