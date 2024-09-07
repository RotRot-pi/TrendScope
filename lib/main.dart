import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:trendscope/data/network/app_mock_api.dart';
import 'package:logger/logger.dart';

final appLogger = Logger();
void main() async {
  // final dio = Dio();
  // final stockApiService = AppMockApi(dio);

  // try {
  //   final stockData = await stockApiService.getHistoricalData(
  //     'TIME_SERIES_DAILY',
  //     'AAPL',
  //   );
  //   // ... (Process the stockData and display it in your charts)
  // } catch (e) {
  //   logger.e(e);
  // }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stock Analysis',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(),
    );
  }
}
