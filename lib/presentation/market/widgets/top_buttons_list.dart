import 'package:flutter/material.dart';
import 'package:trendscope/presentation/market/widgets/top_button.dart';

class TopButtonsList extends StatefulWidget {
  const TopButtonsList({super.key});

  @override
  State<TopButtonsList> createState() => _TopButtonsListState();
}

class _TopButtonsListState extends State<TopButtonsList> {
  String activeButton = 'Most Viewed';

  void setActiveButton(String title) {
    setState(() {
      activeButton = title;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TopButton(
            title: 'Most Viewed',
            isActive: activeButton == 'Most Viewed',
            onTap: setActiveButton,
          ),
          TopButton(
            title: 'Top Gainers',
            isActive: activeButton == 'Top Gainers',
            onTap: setActiveButton,
          ),
          TopButton(
            title: 'Top Losers',
            isActive: activeButton == 'Top Losers',
            onTap: setActiveButton,
          ),
        ],
      ),
    );
  }
}
