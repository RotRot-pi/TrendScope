// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stocks_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Stock _$StockFromJson(Map<String, dynamic> json) {
  return _Stock.fromJson(json);
}

/// @nodoc
mixin _$Stock {
  String get symbol => throw _privateConstructorUsedError;
  String get companyName => throw _privateConstructorUsedError;
  String get exchange => throw _privateConstructorUsedError;
  String get currentPrice => throw _privateConstructorUsedError;
  String get percentageChange => throw _privateConstructorUsedError;
  String get logoUrl => throw _privateConstructorUsedError;
  DateTime get lastUpdated => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StockCopyWith<Stock> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockCopyWith<$Res> {
  factory $StockCopyWith(Stock value, $Res Function(Stock) then) =
      _$StockCopyWithImpl<$Res, Stock>;
  @useResult
  $Res call(
      {String symbol,
      String companyName,
      String exchange,
      String currentPrice,
      String percentageChange,
      String logoUrl,
      DateTime lastUpdated});
}

/// @nodoc
class _$StockCopyWithImpl<$Res, $Val extends Stock>
    implements $StockCopyWith<$Res> {
  _$StockCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? symbol = null,
    Object? companyName = null,
    Object? exchange = null,
    Object? currentPrice = null,
    Object? percentageChange = null,
    Object? logoUrl = null,
    Object? lastUpdated = null,
  }) {
    return _then(_value.copyWith(
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      exchange: null == exchange
          ? _value.exchange
          : exchange // ignore: cast_nullable_to_non_nullable
              as String,
      currentPrice: null == currentPrice
          ? _value.currentPrice
          : currentPrice // ignore: cast_nullable_to_non_nullable
              as String,
      percentageChange: null == percentageChange
          ? _value.percentageChange
          : percentageChange // ignore: cast_nullable_to_non_nullable
              as String,
      logoUrl: null == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StockImplCopyWith<$Res> implements $StockCopyWith<$Res> {
  factory _$$StockImplCopyWith(
          _$StockImpl value, $Res Function(_$StockImpl) then) =
      __$$StockImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String symbol,
      String companyName,
      String exchange,
      String currentPrice,
      String percentageChange,
      String logoUrl,
      DateTime lastUpdated});
}

/// @nodoc
class __$$StockImplCopyWithImpl<$Res>
    extends _$StockCopyWithImpl<$Res, _$StockImpl>
    implements _$$StockImplCopyWith<$Res> {
  __$$StockImplCopyWithImpl(
      _$StockImpl _value, $Res Function(_$StockImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? symbol = null,
    Object? companyName = null,
    Object? exchange = null,
    Object? currentPrice = null,
    Object? percentageChange = null,
    Object? logoUrl = null,
    Object? lastUpdated = null,
  }) {
    return _then(_$StockImpl(
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      exchange: null == exchange
          ? _value.exchange
          : exchange // ignore: cast_nullable_to_non_nullable
              as String,
      currentPrice: null == currentPrice
          ? _value.currentPrice
          : currentPrice // ignore: cast_nullable_to_non_nullable
              as String,
      percentageChange: null == percentageChange
          ? _value.percentageChange
          : percentageChange // ignore: cast_nullable_to_non_nullable
              as String,
      logoUrl: null == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StockImpl implements _Stock {
  const _$StockImpl(
      {required this.symbol,
      required this.companyName,
      required this.exchange,
      required this.currentPrice,
      required this.percentageChange,
      required this.logoUrl,
      required this.lastUpdated});

  factory _$StockImpl.fromJson(Map<String, dynamic> json) =>
      _$$StockImplFromJson(json);

  @override
  final String symbol;
  @override
  final String companyName;
  @override
  final String exchange;
  @override
  final String currentPrice;
  @override
  final String percentageChange;
  @override
  final String logoUrl;
  @override
  final DateTime lastUpdated;

  @override
  String toString() {
    return 'Stock(symbol: $symbol, companyName: $companyName, exchange: $exchange, currentPrice: $currentPrice, percentageChange: $percentageChange, logoUrl: $logoUrl, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockImpl &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.exchange, exchange) ||
                other.exchange == exchange) &&
            (identical(other.currentPrice, currentPrice) ||
                other.currentPrice == currentPrice) &&
            (identical(other.percentageChange, percentageChange) ||
                other.percentageChange == percentageChange) &&
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, symbol, companyName, exchange,
      currentPrice, percentageChange, logoUrl, lastUpdated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StockImplCopyWith<_$StockImpl> get copyWith =>
      __$$StockImplCopyWithImpl<_$StockImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StockImplToJson(
      this,
    );
  }
}

abstract class _Stock implements Stock {
  const factory _Stock(
      {required final String symbol,
      required final String companyName,
      required final String exchange,
      required final String currentPrice,
      required final String percentageChange,
      required final String logoUrl,
      required final DateTime lastUpdated}) = _$StockImpl;

  factory _Stock.fromJson(Map<String, dynamic> json) = _$StockImpl.fromJson;

  @override
  String get symbol;
  @override
  String get companyName;
  @override
  String get exchange;
  @override
  String get currentPrice;
  @override
  String get percentageChange;
  @override
  String get logoUrl;
  @override
  DateTime get lastUpdated;
  @override
  @JsonKey(ignore: true)
  _$$StockImplCopyWith<_$StockImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StocksResponse _$StocksResponseFromJson(Map<String, dynamic> json) {
  return _StocksResponse.fromJson(json);
}

/// @nodoc
mixin _$StocksResponse {
  List<Stock> get stocks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StocksResponseCopyWith<StocksResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StocksResponseCopyWith<$Res> {
  factory $StocksResponseCopyWith(
          StocksResponse value, $Res Function(StocksResponse) then) =
      _$StocksResponseCopyWithImpl<$Res, StocksResponse>;
  @useResult
  $Res call({List<Stock> stocks});
}

/// @nodoc
class _$StocksResponseCopyWithImpl<$Res, $Val extends StocksResponse>
    implements $StocksResponseCopyWith<$Res> {
  _$StocksResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stocks = null,
  }) {
    return _then(_value.copyWith(
      stocks: null == stocks
          ? _value.stocks
          : stocks // ignore: cast_nullable_to_non_nullable
              as List<Stock>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StocksResponseImplCopyWith<$Res>
    implements $StocksResponseCopyWith<$Res> {
  factory _$$StocksResponseImplCopyWith(_$StocksResponseImpl value,
          $Res Function(_$StocksResponseImpl) then) =
      __$$StocksResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Stock> stocks});
}

/// @nodoc
class __$$StocksResponseImplCopyWithImpl<$Res>
    extends _$StocksResponseCopyWithImpl<$Res, _$StocksResponseImpl>
    implements _$$StocksResponseImplCopyWith<$Res> {
  __$$StocksResponseImplCopyWithImpl(
      _$StocksResponseImpl _value, $Res Function(_$StocksResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stocks = null,
  }) {
    return _then(_$StocksResponseImpl(
      stocks: null == stocks
          ? _value._stocks
          : stocks // ignore: cast_nullable_to_non_nullable
              as List<Stock>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StocksResponseImpl implements _StocksResponse {
  const _$StocksResponseImpl({required final List<Stock> stocks})
      : _stocks = stocks;

  factory _$StocksResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$StocksResponseImplFromJson(json);

  final List<Stock> _stocks;
  @override
  List<Stock> get stocks {
    if (_stocks is EqualUnmodifiableListView) return _stocks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stocks);
  }

  @override
  String toString() {
    return 'StocksResponse(stocks: $stocks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StocksResponseImpl &&
            const DeepCollectionEquality().equals(other._stocks, _stocks));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_stocks));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StocksResponseImplCopyWith<_$StocksResponseImpl> get copyWith =>
      __$$StocksResponseImplCopyWithImpl<_$StocksResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StocksResponseImplToJson(
      this,
    );
  }
}

abstract class _StocksResponse implements StocksResponse {
  const factory _StocksResponse({required final List<Stock> stocks}) =
      _$StocksResponseImpl;

  factory _StocksResponse.fromJson(Map<String, dynamic> json) =
      _$StocksResponseImpl.fromJson;

  @override
  List<Stock> get stocks;
  @override
  @JsonKey(ignore: true)
  _$$StocksResponseImplCopyWith<_$StocksResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
