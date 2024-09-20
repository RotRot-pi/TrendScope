import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trendscope/core/colors.dart';

import 'package:trendscope/presentation/stock_chart/provider/stock_chart_provider.dart';

import 'package:trendscope/presentation/stock_chart/widgets/chart_switcher.dart';
import 'package:trendscope/presentation/stock_chart/widgets/period_selector.dart';
import 'package:trendscope/presentation/stock_chart/widgets/stock_chart_widget.dart';
import 'package:trendscope/presentation/stock_chart/widgets/stock_data_selector_widget.dart';
import 'package:trendscope/presentation/stock_chart/widgets/stock_details_widget.dart';
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
          centerTitle: true,
          title: Text(
            symbol,
            style: const TextStyle(
              color: primaryColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: const [
            StockDataSelectorWidget(),
            ShowMenuButton(),
          ]),
      body: const StockChartBody(),
    );
  }
}

class ShowMenuButton extends StatelessWidget {
  const ShowMenuButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          //Show a buttomSheet to configure the chart
          Scaffold.of(context).showBottomSheet(
              (BuildContext context) => const ChartConfigButtomSheet());
        },
        icon: const Icon(Icons.menu));
  }
}

class StockChartBody extends StatelessWidget {
  const StockChartBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ChartSwitcher(),
        StockChartWidget(),
        StockDetailWidget(),
      ],
    );
  }
}

class ChartConfigButtomSheet extends StatelessWidget {
  const ChartConfigButtomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16), topRight: Radius.circular(16.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: const Column(
        children: [
          ChartConfigButtomSheetHeader(),
          ChartConfigBottomSheetBody(),
        ],
      ),
    );
  }
}

class ChartConfigBottomSheetBody extends StatelessWidget {
  const ChartConfigBottomSheetBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: const [
          TimeFrameSelector(),
          SizedBox(
            height: 16,
          ),
          PeriodSelector(),
          SizedBox(
            height: 16,
          ),
          TrendlineSelector(),
          SizedBox(
            height: 16,
          ),
          ToggleButtonsWidget(),
        ],
      ),
    );
  }
}

class ChartConfigButtomSheetHeader extends StatelessWidget {
  const ChartConfigButtomSheetHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox.fromSize(
            size: const Size(40, 20),
          ),
          const Spacer(),
          Container(
            height: 5,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
          const Spacer(),
          IconButton(
            padding: EdgeInsets.zero,
            icon: const Icon(
              Icons.close,
              size: 20,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
