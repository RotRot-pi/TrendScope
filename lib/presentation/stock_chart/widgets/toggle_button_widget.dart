import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trendscope/presentation/stock_chart/provider/stock_chart_provider.dart';

class ToggleButtonsWidget extends ConsumerWidget {
  const ToggleButtonsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get the current state values for trendline and markers
    final showTrendline = ref.watch(showTrendlineProvider);
    final showOpenCloseMarkers = ref.watch(showOpenCloseMarkesProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Toggle for showing/hiding the trendline
            SwitchListTile(
              title: const Text('Show Trendline'),
              value: showTrendline,
              onChanged: (bool value) {
                ref.read(showTrendlineProvider.notifier).state = value;
              },
              activeColor: Colors.blue, // Customize active toggle color
            ),
            const Divider(height: 1, thickness: 1),
            // Toggle for showing/hiding the open/close markers
            SwitchListTile(
              title: const Text('Show Open/Close Markers'),
              value: showOpenCloseMarkers,
              onChanged: (bool value) {
                ref.read(showOpenCloseMarkesProvider.notifier).state = value;
              },
              activeColor: Colors.blue, // Customize active toggle color
            ),
          ],
        ),
      ),
    );
  }
}
