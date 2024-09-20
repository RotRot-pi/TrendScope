// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stocks_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StockImpl _$$StockImplFromJson(Map<String, dynamic> json) => _$StockImpl(
      symbol: json['symbol'] as String,
      companyName: json['companyName'] as String,
      exchange: json['exchange'] as String,
      currency: json['currency'] as String,
      type: json['type'] as String,
      region: json['region'] as String,
      currentPrice: json['currentPrice'] as String,
      percentageChange: json['percentageChange'] as String,
      logoUrl: json['logoUrl'] as String,
      lastUpdated: DateTime.parse(json['lastUpdated'] as String),
    );

Map<String, dynamic> _$$StockImplToJson(_$StockImpl instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'companyName': instance.companyName,
      'exchange': instance.exchange,
      'currency': instance.currency,
      'type': instance.type,
      'region': instance.region,
      'currentPrice': instance.currentPrice,
      'percentageChange': instance.percentageChange,
      'logoUrl': instance.logoUrl,
      'lastUpdated': instance.lastUpdated.toIso8601String(),
    };

_$StocksResponseImpl _$$StocksResponseImplFromJson(Map<String, dynamic> json) =>
    _$StocksResponseImpl(
      stocks: (json['stocks'] as List<dynamic>)
          .map((e) => Stock.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$StocksResponseImplToJson(
        _$StocksResponseImpl instance) =>
    <String, dynamic>{
      'stocks': instance.stocks,
    };
