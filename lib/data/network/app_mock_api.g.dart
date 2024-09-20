// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_mock_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element

class _AppMockApi implements AppMockApi {
  _AppMockApi(
    this._dio, {
    this.baseUrl,
    this.errorLogger,
  }) {
    // baseUrl ??= 'http://127.0.0.1:8000/';
    baseUrl ??= alphaVantageUrl;
  }

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<StockData> getHistoricalData(
    String function,
    String symbol,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'function': function,
      r'symbol': symbol,
    };
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<StockData>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/query',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late StockData _value;
    try {
      _value = StockData.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  // @override
  // Future<StocksResponse> getStocks() async {
  //   final _extra = <String, dynamic>{};
  //   final queryParameters = <String, dynamic>{};
  //   final _headers = <String, dynamic>{};
  //   const Map<String, dynamic>? _data = null;
  //   final _options = _setStreamType<StocksResponse>(Options(
  //     method: 'GET',
  //     headers: _headers,
  //     extra: _extra,
  //   )
  //       .compose(
  //         _dio.options,
  //         '/stocks',
  //         queryParameters: queryParameters,
  //         data: _data,
  //       )
  //       .copyWith(
  //           baseUrl: _combineBaseUrls(
  //         _dio.options.baseUrl,
  //         baseUrl,
  //       )));
  //   final _result = await _dio.fetch<Map<String, dynamic>>(_options);
  //   late StocksResponse _value;
  //   try {
  //     _value = StocksResponse.fromJson(_result.data!);
  //   } on Object catch (e, s) {
  //     errorLogger?.logError(e, s, _options);
  //     rethrow;
  //   }
  //   return _value;
  // }

  @override
  Future<TopMoversData> getTopMoversData({
    required String function,
    required String apiKey,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'function': function,
      r'apikey': apiKey,
    };
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<TopMoversData>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/query',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    logmessage.Logger().i("Get over me");
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    logmessage.Logger().i("Get over me");
    late TopMoversData _value;
    logmessage.Logger().i("Get over me");
    try {
      logmessage.Logger().i("Get over me");
      logmessage.Logger().i("Results:${_result.data!}");
      _value = TopMoversData.fromJson(_result.data!);
      logmessage.Logger().i("Get over me");
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BestMatches> searchSymbol({
    required String function,
    required String keywords,
    required String apiKey,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'function': function,
      r'keywords': keywords,
      r'apikey': apiKey,
    };
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<BestMatches>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/query',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    logmessage.Logger().i("Hi");
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    logmessage.Logger().i("Hi");
    late BestMatches _value;
    logmessage.Logger().i("Hi");
    try {
      logmessage.Logger().i("Hi");
      logmessage.Logger().i(_result.data!);
      _value = BestMatches.fromJson(_result.data!);
      logmessage.Logger().i("Hi");
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
