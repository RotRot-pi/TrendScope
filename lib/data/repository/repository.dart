import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:trendscope/core/constant.dart';
import 'package:trendscope/data/network/app_mock_api.dart';
import 'package:trendscope/domain/model/best_matches.dart';
import 'package:trendscope/domain/model/stock_data.dart';
import 'package:trendscope/domain/model/stocks_response.dart';
import 'package:trendscope/domain/model/top_movers_data.dart';
import 'package:trendscope/domain/repository/repository.dart';
import 'package:trendscope/main.dart';

class RepositoryImpl implements Repository {
  final AppMockApi _appMockApi;

  RepositoryImpl({required Dio dio, required AppMockApi appMockApi})
      : _appMockApi = appMockApi;
  @override
  Future<StockData> getHistoricalDataDaily(String symbol) async {
    try {
      final response =
          await _appMockApi.getHistoricalData('TIME_SERIES_DAILY', symbol);
      appLogger.d("Daily response: ${response.timeSeriesDaily?.values.first}");
      return response;
    } catch (e) {
      appLogger.e(e);
      throw Exception(e.toString());
      //     return Left(Failure(e.toString()));
    }
  }

  @override
  Future<StockData> getHistoricalDataWeekly(String symbol) async {
    try {
      final response =
          await _appMockApi.getHistoricalData('TIME_SERIES_WEEKLY', symbol);
      appLogger
          .d("Weekly response: ${response.timeSeriesWeekly?.values.first}");
      return response;
    } catch (e) {
      appLogger.e(e);
      throw Exception(e.toString());
      //     return Left(Failure(e.toString()));
    }
  }

  @override
  Future<StockData> getHistoricalDataMonthly(String symbol) async {
    try {
      final response =
          await _appMockApi.getHistoricalData('TIME_SERIES_MONTHLY', symbol);
      appLogger
          .d("Monthly response: ${response.timeSeriesMonthly?.values.first}");
      return response;
    } catch (e) {
      appLogger.e(e);
      throw Exception(e.toString());
      //     return Left(Failure(e.toString()));
    }
  }

  @override
  Future<StockData> getHistoricalDataYearly(String symbol) async {
    try {
      final response =
          await _appMockApi.getHistoricalData('TIME_SERIES_YEARLY', symbol);
      appLogger
          .d("Yearly response: ${response.timeSeriesYearly?.values.first}");
      return response;
    } catch (e) {
      appLogger.e(e);
      throw Exception(e.toString());
      //     return Left(Failure(e.toString()));
    }
  }

  @override
  Future<StockData> getHistoricalDataFiveYears(String symbol) async {
    try {
      final response =
          await _appMockApi.getHistoricalData('TIME_SERIES_5YEAR', symbol);
      appLogger
          .d("5 Years response: ${response.timeSeriesFiveYears?.values.first}");
      return response;
    } catch (e) {
      appLogger.e(e);
      throw Exception(e.toString());
      //     return Left(Failure(e.toString()));
    }
  }

  // @override
  // Future<StocksResponse> getStocks() {
  //   try {
  //     final response = _appMockApi.getStocks();
  //     return response;
  //   } catch (e) {
  //     appLogger.e(e);
  //     throw Exception(e.toString());
  //     //     return Left(Failure(e.toString()));
  //   }
  // }

  @override
  Future<TopMoversData> getTopMoversData() async {
    try {
      final response = await _appMockApi.getTopMoversData(
        function: 'TOP_GAINERS_LOSERS',
        apiKey: alphaVantageApiKey,
      );
      return response;
    } catch (e) {
      appLogger.e(e);
      throw Exception(e.toString());
    }
  }

  @override
  Future<StocksResponse> getStocks() async {
    try {
      final TopMoversData topMoversData = await getTopMoversData();

      final List<Stock> stocks = [];
      final List<TopMoverStock> allMovers = [
        ...topMoversData.topGainers,
        ...topMoversData.topLosers,
        ...topMoversData.mostActivelyTraded
      ];

      final Map<String, BestMatch> symbolCache =
          {}; // Cache now stores BestMatch objects

      for (final mover in allMovers) {
        final ticker = mover.ticker;
        appLogger.i("I am here");
        if (symbolCache.containsKey(ticker)) {
          appLogger.i("I am here IF");
          final cachedData = symbolCache[ticker]!;
          appLogger.i("I am here IF");
          stocks.add(Stock(
            symbol: ticker,
            companyName: cachedData.name ?? '',
            exchange: '',
            currency: cachedData.currency ?? '',
            type: cachedData.type ?? '',
            region: cachedData.region ?? '',
            currentPrice: mover.price.toString(),
            percentageChange: mover.changePercentage,
            logoUrl:
                "https://logo.clearbit.com/${cachedData.name?.replaceAll(' ', '')}.com'",
            lastUpdated: topMoversData.lastUpdated,
          ));
          appLogger.i("I am here IF");
        } else {
          appLogger.i("I am here ELSE");
          final BestMatches bestMatches = await _appMockApi.searchSymbol(
            function: 'SYMBOL_SEARCH',
            keywords: ticker,
            apiKey: alphaVantageApiKey,
          );
          appLogger.i("I am here ELSE");
          final BestMatch? bestMatch = (bestMatches as List?)
              ?.firstOrNull; // Get the first BestMatch from the list
          appLogger.i("I am here ELSE");
          if (bestMatch != null) {
            symbolCache[ticker] = bestMatch; // Cache the BestMatch object
            appLogger.i("I am here ELSE");
            stocks.add(
              Stock(
                symbol: ticker,
                companyName: bestMatch.name ?? '',
                exchange: '',
                currency: bestMatch.currency ?? '',
                type: bestMatch.type ?? '',
                region: bestMatch.region ?? '',
                currentPrice: mover.price.toString(),
                percentageChange: mover.changePercentage,
                logoUrl:
                    'https://logo.clearbit.com/${bestMatch.name?.replaceAll(' ', '')}.com',
                lastUpdated: topMoversData.lastUpdated,
              ),
            );
            appLogger.i("I am here ELSE");
          }
        }
      }
      appLogger.i("I am here Done");
      return StocksResponse(stocks: stocks);
    } catch (e) {
      appLogger.e(e);
      throw Exception(e.toString());
    }
  }
}
