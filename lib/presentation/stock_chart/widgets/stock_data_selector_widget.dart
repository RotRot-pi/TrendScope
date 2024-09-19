import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:trendscope/core/constant.dart';
import 'package:trendscope/presentation/stock_chart/provider/stock_chart_provider.dart';

class StockDataSelectorWidget extends StatelessWidget {
  const StockDataSelectorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 100),
      child: FittedBox(
        child: Consumer(builder: (context, ref, child) {
          return MultiSelectDialogField(
            items: stockSymbols
                .map((symbol) => MultiSelectItem(symbol, symbol))
                .toList(),
            onConfirm: (List<String> selectedValues) {
              ref.read(selectedSymbolsProvider.notifier).state = selectedValues;
            },
            buttonIcon: const Icon(Icons.compare_arrows_rounded),
            buttonText: const Text(''),
            listType: MultiSelectListType.CHIP,
          );
        }),
      ),
    );
  }
}
