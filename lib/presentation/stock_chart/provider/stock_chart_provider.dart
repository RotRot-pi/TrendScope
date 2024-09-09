//Create stock chart provider using riverpod
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trendscope/core/di.dart';
import 'package:trendscope/domain/model/stock_data.dart';
import 'package:trendscope/domain/usecases/get_historical_data.dart';

//stock chart provider
//the provider will get the data from the repository
//i need the stock data time series for the date
//and the daily data for the prices and volume

final stockChartProvider = FutureProvider.family<StockData, String>(
  (ref, symbol) async {
    return ref
        .read(getHistoricalDataProvider)
        .call('TIME_SERIES_DAILY', symbol);
  },
);

final getHistoricalDataProvider = Provider<GetHistoricalData>(
  (ref) => GetHistoricalData(
    instance(),
  ),
);
