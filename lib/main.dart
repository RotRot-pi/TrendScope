import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trendscope/core/di.dart';
import 'package:logger/logger.dart';
import 'package:trendscope/presentation/stock_chart/view/stock_chart_view.dart';

final appLogger = Logger();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(const ProviderScope(child: MyApp()));
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
      home: const StockChartView(),
    );
  }
}
