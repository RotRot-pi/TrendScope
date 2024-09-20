// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'top_movers_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TopMoversData _$TopMoversDataFromJson(Map<String, dynamic> json) {
  return _TopMoversData.fromJson(json);
}

/// @nodoc
mixin _$TopMoversData {
  String get metadata => throw _privateConstructorUsedError;
  DateTime get lastUpdated => throw _privateConstructorUsedError;
  List<TopMoverStock> get topGainers => throw _privateConstructorUsedError;
  List<TopMoverStock> get topLosers => throw _privateConstructorUsedError;
  List<TopMoverStock> get mostActivelyTraded =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TopMoversDataCopyWith<TopMoversData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopMoversDataCopyWith<$Res> {
  factory $TopMoversDataCopyWith(
          TopMoversData value, $Res Function(TopMoversData) then) =
      _$TopMoversDataCopyWithImpl<$Res, TopMoversData>;
  @useResult
  $Res call(
      {String metadata,
      DateTime lastUpdated,
      List<TopMoverStock> topGainers,
      List<TopMoverStock> topLosers,
      List<TopMoverStock> mostActivelyTraded});
}

/// @nodoc
class _$TopMoversDataCopyWithImpl<$Res, $Val extends TopMoversData>
    implements $TopMoversDataCopyWith<$Res> {
  _$TopMoversDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? metadata = null,
    Object? lastUpdated = null,
    Object? topGainers = null,
    Object? topLosers = null,
    Object? mostActivelyTraded = null,
  }) {
    return _then(_value.copyWith(
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      topGainers: null == topGainers
          ? _value.topGainers
          : topGainers // ignore: cast_nullable_to_non_nullable
              as List<TopMoverStock>,
      topLosers: null == topLosers
          ? _value.topLosers
          : topLosers // ignore: cast_nullable_to_non_nullable
              as List<TopMoverStock>,
      mostActivelyTraded: null == mostActivelyTraded
          ? _value.mostActivelyTraded
          : mostActivelyTraded // ignore: cast_nullable_to_non_nullable
              as List<TopMoverStock>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TopMoversDataImplCopyWith<$Res>
    implements $TopMoversDataCopyWith<$Res> {
  factory _$$TopMoversDataImplCopyWith(
          _$TopMoversDataImpl value, $Res Function(_$TopMoversDataImpl) then) =
      __$$TopMoversDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String metadata,
      DateTime lastUpdated,
      List<TopMoverStock> topGainers,
      List<TopMoverStock> topLosers,
      List<TopMoverStock> mostActivelyTraded});
}

/// @nodoc
class __$$TopMoversDataImplCopyWithImpl<$Res>
    extends _$TopMoversDataCopyWithImpl<$Res, _$TopMoversDataImpl>
    implements _$$TopMoversDataImplCopyWith<$Res> {
  __$$TopMoversDataImplCopyWithImpl(
      _$TopMoversDataImpl _value, $Res Function(_$TopMoversDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? metadata = null,
    Object? lastUpdated = null,
    Object? topGainers = null,
    Object? topLosers = null,
    Object? mostActivelyTraded = null,
  }) {
    return _then(_$TopMoversDataImpl(
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      topGainers: null == topGainers
          ? _value._topGainers
          : topGainers // ignore: cast_nullable_to_non_nullable
              as List<TopMoverStock>,
      topLosers: null == topLosers
          ? _value._topLosers
          : topLosers // ignore: cast_nullable_to_non_nullable
              as List<TopMoverStock>,
      mostActivelyTraded: null == mostActivelyTraded
          ? _value._mostActivelyTraded
          : mostActivelyTraded // ignore: cast_nullable_to_non_nullable
              as List<TopMoverStock>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TopMoversDataImpl implements _TopMoversData {
  const _$TopMoversDataImpl(
      {required this.metadata,
      required this.lastUpdated,
      required final List<TopMoverStock> topGainers,
      required final List<TopMoverStock> topLosers,
      required final List<TopMoverStock> mostActivelyTraded})
      : _topGainers = topGainers,
        _topLosers = topLosers,
        _mostActivelyTraded = mostActivelyTraded;

  factory _$TopMoversDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$TopMoversDataImplFromJson(json);

  @override
  final String metadata;
  @override
  final DateTime lastUpdated;
  final List<TopMoverStock> _topGainers;
  @override
  List<TopMoverStock> get topGainers {
    if (_topGainers is EqualUnmodifiableListView) return _topGainers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topGainers);
  }

  final List<TopMoverStock> _topLosers;
  @override
  List<TopMoverStock> get topLosers {
    if (_topLosers is EqualUnmodifiableListView) return _topLosers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topLosers);
  }

  final List<TopMoverStock> _mostActivelyTraded;
  @override
  List<TopMoverStock> get mostActivelyTraded {
    if (_mostActivelyTraded is EqualUnmodifiableListView)
      return _mostActivelyTraded;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mostActivelyTraded);
  }

  @override
  String toString() {
    return 'TopMoversData(metadata: $metadata, lastUpdated: $lastUpdated, topGainers: $topGainers, topLosers: $topLosers, mostActivelyTraded: $mostActivelyTraded)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TopMoversDataImpl &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated) &&
            const DeepCollectionEquality()
                .equals(other._topGainers, _topGainers) &&
            const DeepCollectionEquality()
                .equals(other._topLosers, _topLosers) &&
            const DeepCollectionEquality()
                .equals(other._mostActivelyTraded, _mostActivelyTraded));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      metadata,
      lastUpdated,
      const DeepCollectionEquality().hash(_topGainers),
      const DeepCollectionEquality().hash(_topLosers),
      const DeepCollectionEquality().hash(_mostActivelyTraded));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TopMoversDataImplCopyWith<_$TopMoversDataImpl> get copyWith =>
      __$$TopMoversDataImplCopyWithImpl<_$TopMoversDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TopMoversDataImplToJson(
      this,
    );
  }
}

abstract class _TopMoversData implements TopMoversData {
  const factory _TopMoversData(
          {required final String metadata,
          required final DateTime lastUpdated,
          required final List<TopMoverStock> topGainers,
          required final List<TopMoverStock> topLosers,
          required final List<TopMoverStock> mostActivelyTraded}) =
      _$TopMoversDataImpl;

  factory _TopMoversData.fromJson(Map<String, dynamic> json) =
      _$TopMoversDataImpl.fromJson;

  @override
  String get metadata;
  @override
  DateTime get lastUpdated;
  @override
  List<TopMoverStock> get topGainers;
  @override
  List<TopMoverStock> get topLosers;
  @override
  List<TopMoverStock> get mostActivelyTraded;
  @override
  @JsonKey(ignore: true)
  _$$TopMoversDataImplCopyWith<_$TopMoversDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TopMoverStock _$TopMoverStockFromJson(Map<String, dynamic> json) {
  return _TopMoverStock.fromJson(json);
}

/// @nodoc
mixin _$TopMoverStock {
  String get ticker => throw _privateConstructorUsedError;
  double get price =>
      throw _privateConstructorUsedError; // Use double instead of String for price
  double get changeAmount =>
      throw _privateConstructorUsedError; // Use double instead of String
  String get changePercentage => throw _privateConstructorUsedError;
  int get volume => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TopMoverStockCopyWith<TopMoverStock> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopMoverStockCopyWith<$Res> {
  factory $TopMoverStockCopyWith(
          TopMoverStock value, $Res Function(TopMoverStock) then) =
      _$TopMoverStockCopyWithImpl<$Res, TopMoverStock>;
  @useResult
  $Res call(
      {String ticker,
      double price,
      double changeAmount,
      String changePercentage,
      int volume});
}

/// @nodoc
class _$TopMoverStockCopyWithImpl<$Res, $Val extends TopMoverStock>
    implements $TopMoverStockCopyWith<$Res> {
  _$TopMoverStockCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ticker = null,
    Object? price = null,
    Object? changeAmount = null,
    Object? changePercentage = null,
    Object? volume = null,
  }) {
    return _then(_value.copyWith(
      ticker: null == ticker
          ? _value.ticker
          : ticker // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      changeAmount: null == changeAmount
          ? _value.changeAmount
          : changeAmount // ignore: cast_nullable_to_non_nullable
              as double,
      changePercentage: null == changePercentage
          ? _value.changePercentage
          : changePercentage // ignore: cast_nullable_to_non_nullable
              as String,
      volume: null == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TopMoverStockImplCopyWith<$Res>
    implements $TopMoverStockCopyWith<$Res> {
  factory _$$TopMoverStockImplCopyWith(
          _$TopMoverStockImpl value, $Res Function(_$TopMoverStockImpl) then) =
      __$$TopMoverStockImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String ticker,
      double price,
      double changeAmount,
      String changePercentage,
      int volume});
}

/// @nodoc
class __$$TopMoverStockImplCopyWithImpl<$Res>
    extends _$TopMoverStockCopyWithImpl<$Res, _$TopMoverStockImpl>
    implements _$$TopMoverStockImplCopyWith<$Res> {
  __$$TopMoverStockImplCopyWithImpl(
      _$TopMoverStockImpl _value, $Res Function(_$TopMoverStockImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ticker = null,
    Object? price = null,
    Object? changeAmount = null,
    Object? changePercentage = null,
    Object? volume = null,
  }) {
    return _then(_$TopMoverStockImpl(
      ticker: null == ticker
          ? _value.ticker
          : ticker // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      changeAmount: null == changeAmount
          ? _value.changeAmount
          : changeAmount // ignore: cast_nullable_to_non_nullable
              as double,
      changePercentage: null == changePercentage
          ? _value.changePercentage
          : changePercentage // ignore: cast_nullable_to_non_nullable
              as String,
      volume: null == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TopMoverStockImpl implements _TopMoverStock {
  const _$TopMoverStockImpl(
      {required this.ticker,
      required this.price,
      required this.changeAmount,
      required this.changePercentage,
      required this.volume});

  factory _$TopMoverStockImpl.fromJson(Map<String, dynamic> json) =>
      _$$TopMoverStockImplFromJson(json);

  @override
  final String ticker;
  @override
  final double price;
// Use double instead of String for price
  @override
  final double changeAmount;
// Use double instead of String
  @override
  final String changePercentage;
  @override
  final int volume;

  @override
  String toString() {
    return 'TopMoverStock(ticker: $ticker, price: $price, changeAmount: $changeAmount, changePercentage: $changePercentage, volume: $volume)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TopMoverStockImpl &&
            (identical(other.ticker, ticker) || other.ticker == ticker) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.changeAmount, changeAmount) ||
                other.changeAmount == changeAmount) &&
            (identical(other.changePercentage, changePercentage) ||
                other.changePercentage == changePercentage) &&
            (identical(other.volume, volume) || other.volume == volume));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, ticker, price, changeAmount, changePercentage, volume);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TopMoverStockImplCopyWith<_$TopMoverStockImpl> get copyWith =>
      __$$TopMoverStockImplCopyWithImpl<_$TopMoverStockImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TopMoverStockImplToJson(
      this,
    );
  }
}

abstract class _TopMoverStock implements TopMoverStock {
  const factory _TopMoverStock(
      {required final String ticker,
      required final double price,
      required final double changeAmount,
      required final String changePercentage,
      required final int volume}) = _$TopMoverStockImpl;

  factory _TopMoverStock.fromJson(Map<String, dynamic> json) =
      _$TopMoverStockImpl.fromJson;

  @override
  String get ticker;
  @override
  double get price;
  @override // Use double instead of String for price
  double get changeAmount;
  @override // Use double instead of String
  String get changePercentage;
  @override
  int get volume;
  @override
  @JsonKey(ignore: true)
  _$$TopMoverStockImplCopyWith<_$TopMoverStockImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
