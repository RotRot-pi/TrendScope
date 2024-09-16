import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trendscope/core/constant.dart';
import 'package:trendscope/core/enums.dart';
import 'package:trendscope/presentation/common/helpers/stock_chart_helper.dart';
import 'package:trendscope/presentation/stock_chart/provider/stock_chart_provider.dart';

class TimeFrameSelector extends ConsumerWidget {
  const TimeFrameSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTimeFrame = ref.watch(selectedTimeFrameProvider);
    final currentPeriod = ref.watch(selectedPeriodProvider);

    const timeFrames = ChartTimeFrame.values;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(16.0), // p-4 in Tailwind
        child: Row(
          children: timeFrames.map((timeFrame) {
            final label = timeFrame
                .toString()
                .split('.')
                .last
                .replaceAll('fiveYears', '5 years');
            return Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 8.0), // space-x-2 in Tailwind
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 12), // px-4 py-2
                  shape: const StadiumBorder(), // rounded-full
                  backgroundColor: selectedTimeFrame == timeFrame
                      ? Colors.blue // bg-blue-500
                      : Colors.grey[200], // bg-gray-200
                  foregroundColor: selectedTimeFrame == timeFrame
                      ? Colors.white // text-white
                      : Colors.black, // default text color
                ),
                onPressed: () {
                  // Update the selected time frame
                  ref.read(selectedTimeFrameProvider.notifier).state =
                      timeFrame;

                  // Adjust the selected period if necessary
                  final validPeriods =
                      StockChartHelpers.getValidPeriods(timeFrame);
                  if (!validPeriods.contains(currentPeriod)) {
                    final newPeriod = validPeriods.lastWhere(
                      (period) =>
                          periods.indexOf(period) <=
                          periods.indexOf(currentPeriod),
                      orElse: () => validPeriods.first,
                    );
                    ref.read(selectedPeriodProvider.notifier).state = newPeriod;
                  }
                },
                child: Text(label),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
