import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trendscope/presentation/market/provider/market_provider.dart'; // Import the new provider
import 'package:trendscope/presentation/market/widgets/top_button.dart';

class TopButtonsList extends ConsumerWidget {
  // Change to ConsumerWidget
  const TopButtonsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeButton = ref.watch(
        activeTopMoversButtonProvider); // Get the active button from the provider

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: SizedBox(
        height: 40,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          separatorBuilder: (context, index) => const SizedBox(width: 16),
          itemBuilder: (context, index) {
            final buttonTitles = [
              'Top Gainers',
              'Top Losers',
              'Most Actively Traded'
            ];

            return TopButton(
              title: buttonTitles[index],
              isActive: activeButton == buttonTitles[index],
              onTap: (title) {
                ref.read(activeTopMoversButtonProvider.notifier).state = title;
              },
            );
          },
        ),
      ),
    );
  }
}
