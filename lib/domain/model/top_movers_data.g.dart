// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_movers_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TopMoversDataImpl _$$TopMoversDataImplFromJson(Map<String, dynamic> json) =>
    _$TopMoversDataImpl(
      metadata: json['metadata'] as String? ?? '',
      // lastUpdated: DateTime.parse(json['last_updated'] as String),
      lastUpdated: intl.DateFormat('yyyy-MM-dd HH:mm:ss z').parse(
          json['last_updated'] as String? ??
              '2000-08-09 07:00:00 Africa/Algiers'),
      topGainers: (json['top_gainers'] as List<dynamic>)
          .map((e) => TopMoverStock.fromJson(e as Map<String, dynamic>? ?? {}))
          .toList(),
      topLosers: (json['top_losers'] as List<dynamic>? ?? [])
          .map((e) => TopMoverStock.fromJson(e as Map<String, dynamic>? ?? {}))
          .toList(),
      mostActivelyTraded: (json['most_actively_traded'] as List<dynamic>? ?? [])
          .map((e) => TopMoverStock.fromJson(e as Map<String, dynamic>? ?? {}))
          .toList(),
    );

Map<String, dynamic> _$$TopMoversDataImplToJson(_$TopMoversDataImpl instance) =>
    <String, dynamic>{
      'metadata': instance.metadata,
      'lastUpdated': instance.lastUpdated.toIso8601String(),
      'topGainers': instance.topGainers,
      'topLosers': instance.topLosers,
      'mostActivelyTraded': instance.mostActivelyTraded,
    };

_$TopMoverStockImpl _$$TopMoverStockImplFromJson(Map<String, dynamic> json) =>
    _$TopMoverStockImpl(
      ticker: json['ticker'] as String? ?? '',
      price: double.tryParse(json['price']) ?? 0.0,
      changeAmount: double.tryParse(json['change_amount']) ?? 0.0,
      changePercentage: json['change_percentage'] as String? ?? '',
      volume: int.tryParse(json['volume']) ?? 0,
    );

Map<String, dynamic> _$$TopMoverStockImplToJson(_$TopMoverStockImpl instance) =>
    <String, dynamic>{
      'ticker': instance.ticker,
      'price': instance.price,
      'changeAmount': instance.changeAmount,
      'changePercentage': instance.changePercentage,
      'volume': instance.volume,
    };
