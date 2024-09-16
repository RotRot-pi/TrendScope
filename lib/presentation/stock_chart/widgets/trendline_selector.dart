import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:trendscope/presentation/stock_chart/provider/stock_chart_provider.dart';

class TrendlineSelector extends ConsumerWidget {
  const TrendlineSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Select Trendline',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              alignment: WrapAlignment.center,
              children: [
                _buildTrendlineChip(ref, 'Linear', TrendlineType.linear),
                _buildTrendlineChip(
                    ref, 'Moving Avg', TrendlineType.movingAverage),
                _buildTrendlineChip(
                    ref, 'Exponential', TrendlineType.exponential),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to create a Chip for each trendline type
  Widget _buildTrendlineChip(WidgetRef ref, String label, TrendlineType type) {
    final isSelected = ref.watch(trendlineVisibilityProvider(type));

    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      selectedColor: Colors.blue, // Color for selected chips
      onSelected: (bool selected) {
        ref.read(trendlineVisibilityProvider(type).notifier).state = selected;
      },
    );
  }
}
