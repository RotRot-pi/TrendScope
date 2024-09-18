import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trendscope/core/colors.dart';
import 'package:trendscope/presentation/common/helpers/stock_chart_helper.dart';
import 'package:trendscope/presentation/stock_chart/provider/stock_chart_provider.dart';

class PeriodSelector extends ConsumerWidget {
  const PeriodSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPeriod = ref.watch(selectedPeriodProvider);
    final selectedTimeFrame = ref.watch(selectedTimeFrameProvider);

    // Get valid periods based on the selected time frame
    final validPeriods = StockChartHelpers.getValidPeriods(selectedTimeFrame);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: const EdgeInsets.all(12), // Equivalent to p-2
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: primaryColor),
        ),
        elevation: 0, // Shadow effect
      ),
      onPressed: () async {
        // Show a dropdown menu when the button is pressed
        final selected = await showMenu<String>(
          context: context,
          color: Colors.white,
          position: const RelativeRect.fromLTRB(100, 200, 100, 100),
          items: validPeriods.map((String period) {
            return PopupMenuItem<String>(
              value: period,
              child: Text(period),
            );
          }).toList(),
        );

        // If a period was selected, update the state
        if (selected != null && selected != selectedPeriod) {
          ref.read(selectedPeriodProvider.notifier).state = selected;
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(selectedPeriod, style: const TextStyle(color: Colors.black)),
          Icon(Icons.expand_more,
              color: Colors.grey[600]), // ChevronDown equivalent
        ],
      ),
    );
  }
}
