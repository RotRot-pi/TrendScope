// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'best_matches.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BestMatchImpl _$$BestMatchImplFromJson(Map<String, dynamic> json) =>
    _$BestMatchImpl(
      symbol: json['1. symbol'] as String?,
      name: json['2. name'] as String?,
      type: json['3. type'] as String?,
      region: json['4. region'] as String?,
      marketOpen: json['5. marketOpen'] as String?,
      marketClose: json['6. marketClose'] as String?,
      timezone: json['7. timezone'] as String?,
      currency: json['8. currency'] as String?,
      matchScore: json['9. matchScore'] as String?,
    );

Map<String, dynamic> _$$BestMatchImplToJson(_$BestMatchImpl instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'name': instance.name,
      'type': instance.type,
      'region': instance.region,
      'marketOpen': instance.marketOpen,
      'marketClose': instance.marketClose,
      'timezone': instance.timezone,
      'currency': instance.currency,
      'matchScore': instance.matchScore,
    };

_$BestMatchesImpl _$$BestMatchesImplFromJson(Map<String, dynamic> json) =>
    _$BestMatchesImpl(
      bestMatches: (json['bestMatches'] as List<dynamic>)
          .map((e) => BestMatch.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BestMatchesImplToJson(_$BestMatchesImpl instance) =>
    <String, dynamic>{
      'bestMatches': instance.bestMatches,
    };
