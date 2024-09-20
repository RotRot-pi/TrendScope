import 'package:freezed_annotation/freezed_annotation.dart';

part 'best_matches.freezed.dart';
part 'best_matches.g.dart';

@freezed
class BestMatch with _$BestMatch {
  const factory BestMatch({
    String? symbol,
    String? name,
    String? type,
    String? region,
    String? marketOpen,
    String? marketClose,
    String? timezone,
    String? currency,
    String? matchScore,
  }) = _BestMatch;

  factory BestMatch.fromJson(Map<String, dynamic> json) =>
      _$BestMatchFromJson(json);
}

@freezed
class BestMatches with _$BestMatches {
  const factory BestMatches({required List<BestMatch> bestMatches}) =
      _BestMatches;

  factory BestMatches.fromJson(Map<String, dynamic> json) =>
      _$BestMatchesFromJson(json);
}
