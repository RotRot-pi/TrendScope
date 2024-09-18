import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:trendscope/core/colors.dart';
import 'package:trendscope/presentation/stock_chart/provider/stock_chart_provider.dart';

class TrendlineSelector extends ConsumerWidget {
  const TrendlineSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Select Trendline',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8.0,
          runSpacing: 4.0,
          alignment: WrapAlignment.start,
          children: [
            _buildTrendlineChip(ref, 'Linear', TrendlineType.linear),
            _buildTrendlineChip(ref, 'Moving Avg', TrendlineType.movingAverage),
            _buildTrendlineChip(ref, 'Exponential', TrendlineType.exponential),
          ],
        ),
      ],
    );
  }

  // Helper function to create a Chip for each trendline type
  Widget _buildTrendlineChip(WidgetRef ref, String label, TrendlineType type) {
    final isSelected = ref.watch(trendlineVisibilityProvider(type));

    return ChoiceChip(
      label: Text(
        label,
        style: TextStyle(color: isSelected ? Colors.white : primaryColor),
      ),
      selected: isSelected,
      selectedColor: primaryColor, // Color for selected chips
      onSelected: (bool selected) {
        ref.read(trendlineVisibilityProvider(type).notifier).state = selected;
      },
    );
  }
}
