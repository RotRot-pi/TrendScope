import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trendscope/presentation/market/provider/market_provider.dart';
import 'package:trendscope/presentation/market/widgets/background_widget.dart';
import 'package:trendscope/presentation/market/widgets/bottom_nav_bar.dart';
import 'package:trendscope/presentation/market/widgets/market_list.dart';
import 'package:trendscope/presentation/market/widgets/top_buttons_list.dart';

class MarketView extends ConsumerWidget {
  const MarketView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final marketData = ref.watch(marketDataProvider);

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            'MARKET',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          const BackgroundWidget(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const TopButtonsList(),
              MarketList(marketData: marketData),
            ],
          ),
          const Positioned(
            bottom: 16,
            left: 48,
            right: 48,
            child: BottomNavBar(),
          )
        ],
      ),
    );
  }
}
