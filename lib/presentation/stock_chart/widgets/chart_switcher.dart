import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trendscope/presentation/stock_chart/provider/stock_chart_provider.dart';

class ChartSwitcher extends ConsumerWidget {
  const ChartSwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chartTypes = ['Candlestick', 'Line'];
    final selectedChartType =
        ref.watch(selectedChartTypeProvider); // Watch the selected chart type

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0), // Equivalent to m-4 in Tailwind
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[200], // Equivalent to bg-gray-200
            borderRadius:
                BorderRadius.circular(50), // Equivalent to rounded-full
          ),
          padding: const EdgeInsets.all(4), // Equivalent to p-1 in Tailwind
          child: Row(
            mainAxisSize: MainAxisSize.min, // To fit the content tightly
            children: chartTypes.map((type) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 4.0), // Space between buttons
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12), // Equivalent to px-4 py-2
                    shape: const StadiumBorder(), // Equivalent to rounded-full
                    backgroundColor: selectedChartType == type
                        ? Colors.white
                        : Colors.transparent,
                    shadowColor: selectedChartType == type
                        ? Colors.black
                        : Colors.transparent,
                    elevation: selectedChartType == type ? 2 : 0,
                  ),
                  onPressed: () {
                    // Use Riverpod's ref.read to update the selected chart type
                    ref.read(selectedChartTypeProvider.notifier).state = type;
                  },
                  child: Text(type),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
