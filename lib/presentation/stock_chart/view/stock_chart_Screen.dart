import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:trendscope/presentation/stock_chart/provider/stock_chart_provider.dart';

import 'package:trendscope/presentation/stock_chart/widgets/chart_switcher.dart';
import 'package:trendscope/presentation/stock_chart/widgets/period_selector.dart';
import 'package:trendscope/presentation/stock_chart/widgets/stock_chart_widget.dart';
import 'package:trendscope/presentation/stock_chart/widgets/time_frame_selector.dart';
import 'package:trendscope/presentation/stock_chart/widgets/toggle_button_widget.dart';
import 'package:trendscope/presentation/stock_chart/widgets/trendline_selector.dart';

class StockChartScreen extends ConsumerWidget {
  const StockChartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final symbol = ref.watch(selectedSymbolProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("Stock Data for $symbol"),
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ChartSwitcher(),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TimeFrameSelector(),
                    PeriodSelector(),
                    TrendlineSelector(),
                  ],
                ),
                ToggleButtonsWidget(),
              ],
            ),
          ),
          Expanded(
            child: StockChartWidget(),
          ),
        ],
      ),
    );
  }
}
