import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trendscope/core/colors.dart';
import 'package:trendscope/presentation/stock_chart/provider/stock_chart_provider.dart';

class ToggleButtonsWidget extends ConsumerWidget {
  const ToggleButtonsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get the current state values for trendline and markers
    final showTrendline = ref.watch(showTrendlineProvider);
    final showOpenCloseMarkers = ref.watch(showOpenCloseMarkesProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Show Trendline',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(
              height: 30,
              child: FittedBox(
                child: Switch(
                  value: showTrendline,
                  onChanged: (bool value) {
                    ref.read(showTrendlineProvider.notifier).state = value;
                  },
                  activeColor: primaryColor,
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Show Open/Close Markers',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(
              height: 30,
              child: FittedBox(
                child: Switch(
                  value: showOpenCloseMarkers,
                  onChanged: (bool value) {
                    ref.read(showOpenCloseMarkesProvider.notifier).state =
                        value;
                  },
                  activeColor: primaryColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
