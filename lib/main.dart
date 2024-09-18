import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trendscope/core/colors.dart';
import 'package:trendscope/core/di.dart';
import 'package:logger/logger.dart';
import 'package:trendscope/core/theme.dart';
import 'package:trendscope/presentation/market/view/market_view.dart';

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorSchemeSeed: primaryColor,
          textTheme: textTheme,
          scaffoldBackgroundColor: whiteColor,
          appBarTheme: const AppBarTheme(backgroundColor: whiteColor)),
      home: const MarketView(),
    );
  }
}
