import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trendscope/presentation/market/provider/market_provider.dart';
import 'package:trendscope/presentation/market/widgets/background_widget.dart';
import 'package:trendscope/presentation/market/widgets/bottom_nav_bar.dart';
import 'package:trendscope/presentation/market/widgets/market_list.dart';
import 'package:trendscope/presentation/market/widgets/top_buttons_list.dart';

class MarketView extends StatelessWidget {
  const MarketView({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: const Stack(
        fit: StackFit.expand,
        children: [
          BackgroundWidget(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              TopButtonsList(),
              MarketList(),
            ],
          ),
          Positioned(
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
