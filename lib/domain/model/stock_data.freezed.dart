// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StockData _$StockDataFromJson(Map<String, dynamic> json) {
  return _StockData.fromJson(json);
}

/// @nodoc
mixin _$StockData {
  MetaData get metaData => throw _privateConstructorUsedError;
  Map<String, TimeSeriesData>? get timeSeriesDaily =>
      throw _privateConstructorUsedError;
  Map<String, TimeSeriesData>? get timeSeriesWeekly =>
      throw _privateConstructorUsedError;
  Map<String, TimeSeriesData>? get timeSeriesMonthly =>
      throw _privateConstructorUsedError;
  Map<String, TimeSeriesData>? get timeSeriesYearly =>
      throw _privateConstructorUsedError;
  Map<String, TimeSeriesData>? get timeSeriesFiveYears =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StockDataCopyWith<StockData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockDataCopyWith<$Res> {
  factory $StockDataCopyWith(StockData value, $Res Function(StockData) then) =
      _$StockDataCopyWithImpl<$Res, StockData>;
  @useResult
  $Res call(
      {MetaData metaData,
      Map<String, TimeSeriesData>? timeSeriesDaily,
      Map<String, TimeSeriesData>? timeSeriesWeekly,
      Map<String, TimeSeriesData>? timeSeriesMonthly,
      Map<String, TimeSeriesData>? timeSeriesYearly,
      Map<String, TimeSeriesData>? timeSeriesFiveYears});

  $MetaDataCopyWith<$Res> get metaData;
}

/// @nodoc
class _$StockDataCopyWithImpl<$Res, $Val extends StockData>
    implements $StockDataCopyWith<$Res> {
  _$StockDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? metaData = null,
    Object? timeSeriesDaily = freezed,
    Object? timeSeriesWeekly = freezed,
    Object? timeSeriesMonthly = freezed,
    Object? timeSeriesYearly = freezed,
    Object? timeSeriesFiveYears = freezed,
  }) {
    return _then(_value.copyWith(
      metaData: null == metaData
          ? _value.metaData
          : metaData // ignore: cast_nullable_to_non_nullable
              as MetaData,
      timeSeriesDaily: freezed == timeSeriesDaily
          ? _value.timeSeriesDaily
          : timeSeriesDaily // ignore: cast_nullable_to_non_nullable
              as Map<String, TimeSeriesData>?,
      timeSeriesWeekly: freezed == timeSeriesWeekly
          ? _value.timeSeriesWeekly
          : timeSeriesWeekly // ignore: cast_nullable_to_non_nullable
              as Map<String, TimeSeriesData>?,
      timeSeriesMonthly: freezed == timeSeriesMonthly
          ? _value.timeSeriesMonthly
          : timeSeriesMonthly // ignore: cast_nullable_to_non_nullable
              as Map<String, TimeSeriesData>?,
      timeSeriesYearly: freezed == timeSeriesYearly
          ? _value.timeSeriesYearly
          : timeSeriesYearly // ignore: cast_nullable_to_non_nullable
              as Map<String, TimeSeriesData>?,
      timeSeriesFiveYears: freezed == timeSeriesFiveYears
          ? _value.timeSeriesFiveYears
          : timeSeriesFiveYears // ignore: cast_nullable_to_non_nullable
              as Map<String, TimeSeriesData>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MetaDataCopyWith<$Res> get metaData {
    return $MetaDataCopyWith<$Res>(_value.metaData, (value) {
      return _then(_value.copyWith(metaData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StockDataImplCopyWith<$Res>
    implements $StockDataCopyWith<$Res> {
  factory _$$StockDataImplCopyWith(
          _$StockDataImpl value, $Res Function(_$StockDataImpl) then) =
      __$$StockDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MetaData metaData,
      Map<String, TimeSeriesData>? timeSeriesDaily,
      Map<String, TimeSeriesData>? timeSeriesWeekly,
      Map<String, TimeSeriesData>? timeSeriesMonthly,
      Map<String, TimeSeriesData>? timeSeriesYearly,
      Map<String, TimeSeriesData>? timeSeriesFiveYears});

  @override
  $MetaDataCopyWith<$Res> get metaData;
}

/// @nodoc
class __$$StockDataImplCopyWithImpl<$Res>
    extends _$StockDataCopyWithImpl<$Res, _$StockDataImpl>
    implements _$$StockDataImplCopyWith<$Res> {
  __$$StockDataImplCopyWithImpl(
      _$StockDataImpl _value, $Res Function(_$StockDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? metaData = null,
    Object? timeSeriesDaily = freezed,
    Object? timeSeriesWeekly = freezed,
    Object? timeSeriesMonthly = freezed,
    Object? timeSeriesYearly = freezed,
    Object? timeSeriesFiveYears = freezed,
  }) {
    return _then(_$StockDataImpl(
      metaData: null == metaData
          ? _value.metaData
          : metaData // ignore: cast_nullable_to_non_nullable
              as MetaData,
      timeSeriesDaily: freezed == timeSeriesDaily
          ? _value._timeSeriesDaily
          : timeSeriesDaily // ignore: cast_nullable_to_non_nullable
              as Map<String, TimeSeriesData>?,
      timeSeriesWeekly: freezed == timeSeriesWeekly
          ? _value._timeSeriesWeekly
          : timeSeriesWeekly // ignore: cast_nullable_to_non_nullable
              as Map<String, TimeSeriesData>?,
      timeSeriesMonthly: freezed == timeSeriesMonthly
          ? _value._timeSeriesMonthly
          : timeSeriesMonthly // ignore: cast_nullable_to_non_nullable
              as Map<String, TimeSeriesData>?,
      timeSeriesYearly: freezed == timeSeriesYearly
          ? _value._timeSeriesYearly
          : timeSeriesYearly // ignore: cast_nullable_to_non_nullable
              as Map<String, TimeSeriesData>?,
      timeSeriesFiveYears: freezed == timeSeriesFiveYears
          ? _value._timeSeriesFiveYears
          : timeSeriesFiveYears // ignore: cast_nullable_to_non_nullable
              as Map<String, TimeSeriesData>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StockDataImpl implements _StockData {
  const _$StockDataImpl(
      {required this.metaData,
      final Map<String, TimeSeriesData>? timeSeriesDaily,
      final Map<String, TimeSeriesData>? timeSeriesWeekly,
      final Map<String, TimeSeriesData>? timeSeriesMonthly,
      final Map<String, TimeSeriesData>? timeSeriesYearly,
      final Map<String, TimeSeriesData>? timeSeriesFiveYears})
      : _timeSeriesDaily = timeSeriesDaily,
        _timeSeriesWeekly = timeSeriesWeekly,
        _timeSeriesMonthly = timeSeriesMonthly,
        _timeSeriesYearly = timeSeriesYearly,
        _timeSeriesFiveYears = timeSeriesFiveYears;

  factory _$StockDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$StockDataImplFromJson(json);

  @override
  final MetaData metaData;
  final Map<String, TimeSeriesData>? _timeSeriesDaily;
  @override
  Map<String, TimeSeriesData>? get timeSeriesDaily {
    final value = _timeSeriesDaily;
    if (value == null) return null;
    if (_timeSeriesDaily is EqualUnmodifiableMapView) return _timeSeriesDaily;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, TimeSeriesData>? _timeSeriesWeekly;
  @override
  Map<String, TimeSeriesData>? get timeSeriesWeekly {
    final value = _timeSeriesWeekly;
    if (value == null) return null;
    if (_timeSeriesWeekly is EqualUnmodifiableMapView) return _timeSeriesWeekly;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, TimeSeriesData>? _timeSeriesMonthly;
  @override
  Map<String, TimeSeriesData>? get timeSeriesMonthly {
    final value = _timeSeriesMonthly;
    if (value == null) return null;
    if (_timeSeriesMonthly is EqualUnmodifiableMapView)
      return _timeSeriesMonthly;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, TimeSeriesData>? _timeSeriesYearly;
  @override
  Map<String, TimeSeriesData>? get timeSeriesYearly {
    final value = _timeSeriesYearly;
    if (value == null) return null;
    if (_timeSeriesYearly is EqualUnmodifiableMapView) return _timeSeriesYearly;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, TimeSeriesData>? _timeSeriesFiveYears;
  @override
  Map<String, TimeSeriesData>? get timeSeriesFiveYears {
    final value = _timeSeriesFiveYears;
    if (value == null) return null;
    if (_timeSeriesFiveYears is EqualUnmodifiableMapView)
      return _timeSeriesFiveYears;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'StockData(metaData: $metaData, timeSeriesDaily: $timeSeriesDaily, timeSeriesWeekly: $timeSeriesWeekly, timeSeriesMonthly: $timeSeriesMonthly, timeSeriesYearly: $timeSeriesYearly, timeSeriesFiveYears: $timeSeriesFiveYears)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockDataImpl &&
            (identical(other.metaData, metaData) ||
                other.metaData == metaData) &&
            const DeepCollectionEquality()
                .equals(other._timeSeriesDaily, _timeSeriesDaily) &&
            const DeepCollectionEquality()
                .equals(other._timeSeriesWeekly, _timeSeriesWeekly) &&
            const DeepCollectionEquality()
                .equals(other._timeSeriesMonthly, _timeSeriesMonthly) &&
            const DeepCollectionEquality()
                .equals(other._timeSeriesYearly, _timeSeriesYearly) &&
            const DeepCollectionEquality()
                .equals(other._timeSeriesFiveYears, _timeSeriesFiveYears));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      metaData,
      const DeepCollectionEquality().hash(_timeSeriesDaily),
      const DeepCollectionEquality().hash(_timeSeriesWeekly),
      const DeepCollectionEquality().hash(_timeSeriesMonthly),
      const DeepCollectionEquality().hash(_timeSeriesYearly),
      const DeepCollectionEquality().hash(_timeSeriesFiveYears));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StockDataImplCopyWith<_$StockDataImpl> get copyWith =>
      __$$StockDataImplCopyWithImpl<_$StockDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StockDataImplToJson(
      this,
    );
  }
}

abstract class _StockData implements StockData {
  const factory _StockData(
          {required final MetaData metaData,
          final Map<String, TimeSeriesData>? timeSeriesDaily,
          final Map<String, TimeSeriesData>? timeSeriesWeekly,
          final Map<String, TimeSeriesData>? timeSeriesMonthly,
          final Map<String, TimeSeriesData>? timeSeriesYearly,
          final Map<String, TimeSeriesData>? timeSeriesFiveYears}) =
      _$StockDataImpl;

  factory _StockData.fromJson(Map<String, dynamic> json) =
      _$StockDataImpl.fromJson;

  @override
  MetaData get metaData;
  @override
  Map<String, TimeSeriesData>? get timeSeriesDaily;
  @override
  Map<String, TimeSeriesData>? get timeSeriesWeekly;
  @override
  Map<String, TimeSeriesData>? get timeSeriesMonthly;
  @override
  Map<String, TimeSeriesData>? get timeSeriesYearly;
  @override
  Map<String, TimeSeriesData>? get timeSeriesFiveYears;
  @override
  @JsonKey(ignore: true)
  _$$StockDataImplCopyWith<_$StockDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MetaData _$MetaDataFromJson(Map<String, dynamic> json) {
  return _MetaData.fromJson(json);
}

/// @nodoc
mixin _$MetaData {
  String get information => throw _privateConstructorUsedError;
  String get symbol => throw _privateConstructorUsedError;
  String get lastRefreshed => throw _privateConstructorUsedError;
  String get outputSize => throw _privateConstructorUsedError;
  String get timeZone => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MetaDataCopyWith<MetaData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetaDataCopyWith<$Res> {
  factory $MetaDataCopyWith(MetaData value, $Res Function(MetaData) then) =
      _$MetaDataCopyWithImpl<$Res, MetaData>;
  @useResult
  $Res call(
      {String information,
      String symbol,
      String lastRefreshed,
      String outputSize,
      String timeZone});
}

/// @nodoc
class _$MetaDataCopyWithImpl<$Res, $Val extends MetaData>
    implements $MetaDataCopyWith<$Res> {
  _$MetaDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? information = null,
    Object? symbol = null,
    Object? lastRefreshed = null,
    Object? outputSize = null,
    Object? timeZone = null,
  }) {
    return _then(_value.copyWith(
      information: null == information
          ? _value.information
          : information // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      lastRefreshed: null == lastRefreshed
          ? _value.lastRefreshed
          : lastRefreshed // ignore: cast_nullable_to_non_nullable
              as String,
      outputSize: null == outputSize
          ? _value.outputSize
          : outputSize // ignore: cast_nullable_to_non_nullable
              as String,
      timeZone: null == timeZone
          ? _value.timeZone
          : timeZone // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MetaDataImplCopyWith<$Res>
    implements $MetaDataCopyWith<$Res> {
  factory _$$MetaDataImplCopyWith(
          _$MetaDataImpl value, $Res Function(_$MetaDataImpl) then) =
      __$$MetaDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String information,
      String symbol,
      String lastRefreshed,
      String outputSize,
      String timeZone});
}

/// @nodoc
class __$$MetaDataImplCopyWithImpl<$Res>
    extends _$MetaDataCopyWithImpl<$Res, _$MetaDataImpl>
    implements _$$MetaDataImplCopyWith<$Res> {
  __$$MetaDataImplCopyWithImpl(
      _$MetaDataImpl _value, $Res Function(_$MetaDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? information = null,
    Object? symbol = null,
    Object? lastRefreshed = null,
    Object? outputSize = null,
    Object? timeZone = null,
  }) {
    return _then(_$MetaDataImpl(
      information: null == information
          ? _value.information
          : information // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      lastRefreshed: null == lastRefreshed
          ? _value.lastRefreshed
          : lastRefreshed // ignore: cast_nullable_to_non_nullable
              as String,
      outputSize: null == outputSize
          ? _value.outputSize
          : outputSize // ignore: cast_nullable_to_non_nullable
              as String,
      timeZone: null == timeZone
          ? _value.timeZone
          : timeZone // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MetaDataImpl implements _MetaData {
  const _$MetaDataImpl(
      {required this.information,
      required this.symbol,
      required this.lastRefreshed,
      required this.outputSize,
      required this.timeZone});

  factory _$MetaDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetaDataImplFromJson(json);

  @override
  final String information;
  @override
  final String symbol;
  @override
  final String lastRefreshed;
  @override
  final String outputSize;
  @override
  final String timeZone;

  @override
  String toString() {
    return 'MetaData(information: $information, symbol: $symbol, lastRefreshed: $lastRefreshed, outputSize: $outputSize, timeZone: $timeZone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MetaDataImpl &&
            (identical(other.information, information) ||
                other.information == information) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.lastRefreshed, lastRefreshed) ||
                other.lastRefreshed == lastRefreshed) &&
            (identical(other.outputSize, outputSize) ||
                other.outputSize == outputSize) &&
            (identical(other.timeZone, timeZone) ||
                other.timeZone == timeZone));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, information, symbol, lastRefreshed, outputSize, timeZone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MetaDataImplCopyWith<_$MetaDataImpl> get copyWith =>
      __$$MetaDataImplCopyWithImpl<_$MetaDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MetaDataImplToJson(
      this,
    );
  }
}

abstract class _MetaData implements MetaData {
  const factory _MetaData(
      {required final String information,
      required final String symbol,
      required final String lastRefreshed,
      required final String outputSize,
      required final String timeZone}) = _$MetaDataImpl;

  factory _MetaData.fromJson(Map<String, dynamic> json) =
      _$MetaDataImpl.fromJson;

  @override
  String get information;
  @override
  String get symbol;
  @override
  String get lastRefreshed;
  @override
  String get outputSize;
  @override
  String get timeZone;
  @override
  @JsonKey(ignore: true)
  _$$MetaDataImplCopyWith<_$MetaDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TimeSeriesData _$TimeSeriesDataFromJson(Map<String, dynamic> json) {
  return _TimeSeriesData.fromJson(json);
}

/// @nodoc
mixin _$TimeSeriesData {
  String get open => throw _privateConstructorUsedError;
  String get high => throw _privateConstructorUsedError;
  String get low => throw _privateConstructorUsedError;
  String get close => throw _privateConstructorUsedError;
  String get volume => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimeSeriesDataCopyWith<TimeSeriesData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeSeriesDataCopyWith<$Res> {
  factory $TimeSeriesDataCopyWith(
          TimeSeriesData value, $Res Function(TimeSeriesData) then) =
      _$TimeSeriesDataCopyWithImpl<$Res, TimeSeriesData>;
  @useResult
  $Res call(
      {String open, String high, String low, String close, String volume});
}

/// @nodoc
class _$TimeSeriesDataCopyWithImpl<$Res, $Val extends TimeSeriesData>
    implements $TimeSeriesDataCopyWith<$Res> {
  _$TimeSeriesDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? open = null,
    Object? high = null,
    Object? low = null,
    Object? close = null,
    Object? volume = null,
  }) {
    return _then(_value.copyWith(
      open: null == open
          ? _value.open
          : open // ignore: cast_nullable_to_non_nullable
              as String,
      high: null == high
          ? _value.high
          : high // ignore: cast_nullable_to_non_nullable
              as String,
      low: null == low
          ? _value.low
          : low // ignore: cast_nullable_to_non_nullable
              as String,
      close: null == close
          ? _value.close
          : close // ignore: cast_nullable_to_non_nullable
              as String,
      volume: null == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimeSeriesDataImplCopyWith<$Res>
    implements $TimeSeriesDataCopyWith<$Res> {
  factory _$$TimeSeriesDataImplCopyWith(_$TimeSeriesDataImpl value,
          $Res Function(_$TimeSeriesDataImpl) then) =
      __$$TimeSeriesDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String open, String high, String low, String close, String volume});
}

/// @nodoc
class __$$TimeSeriesDataImplCopyWithImpl<$Res>
    extends _$TimeSeriesDataCopyWithImpl<$Res, _$TimeSeriesDataImpl>
    implements _$$TimeSeriesDataImplCopyWith<$Res> {
  __$$TimeSeriesDataImplCopyWithImpl(
      _$TimeSeriesDataImpl _value, $Res Function(_$TimeSeriesDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? open = null,
    Object? high = null,
    Object? low = null,
    Object? close = null,
    Object? volume = null,
  }) {
    return _then(_$TimeSeriesDataImpl(
      open: null == open
          ? _value.open
          : open // ignore: cast_nullable_to_non_nullable
              as String,
      high: null == high
          ? _value.high
          : high // ignore: cast_nullable_to_non_nullable
              as String,
      low: null == low
          ? _value.low
          : low // ignore: cast_nullable_to_non_nullable
              as String,
      close: null == close
          ? _value.close
          : close // ignore: cast_nullable_to_non_nullable
              as String,
      volume: null == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TimeSeriesDataImpl implements _TimeSeriesData {
  const _$TimeSeriesDataImpl(
      {required this.open,
      required this.high,
      required this.low,
      required this.close,
      required this.volume});

  factory _$TimeSeriesDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimeSeriesDataImplFromJson(json);

  @override
  final String open;
  @override
  final String high;
  @override
  final String low;
  @override
  final String close;
  @override
  final String volume;

  @override
  String toString() {
    return 'TimeSeriesData(open: $open, high: $high, low: $low, close: $close, volume: $volume)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeSeriesDataImpl &&
            (identical(other.open, open) || other.open == open) &&
            (identical(other.high, high) || other.high == high) &&
            (identical(other.low, low) || other.low == low) &&
            (identical(other.close, close) || other.close == close) &&
            (identical(other.volume, volume) || other.volume == volume));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, open, high, low, close, volume);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeSeriesDataImplCopyWith<_$TimeSeriesDataImpl> get copyWith =>
      __$$TimeSeriesDataImplCopyWithImpl<_$TimeSeriesDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimeSeriesDataImplToJson(
      this,
    );
  }
}

abstract class _TimeSeriesData implements TimeSeriesData {
  const factory _TimeSeriesData(
      {required final String open,
      required final String high,
      required final String low,
      required final String close,
      required final String volume}) = _$TimeSeriesDataImpl;

  factory _TimeSeriesData.fromJson(Map<String, dynamic> json) =
      _$TimeSeriesDataImpl.fromJson;

  @override
  String get open;
  @override
  String get high;
  @override
  String get low;
  @override
  String get close;
  @override
  String get volume;
  @override
  @JsonKey(ignore: true)
  _$$TimeSeriesDataImplCopyWith<_$TimeSeriesDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
