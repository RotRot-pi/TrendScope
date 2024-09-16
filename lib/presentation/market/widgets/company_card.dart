import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trendscope/domain/model/stocks_response.dart';
import 'package:trendscope/presentation/stock_chart/provider/stock_chart_provider.dart';
import 'package:trendscope/presentation/stock_chart/view/stock_chart_Screen.dart';

class CompanyCard extends ConsumerWidget {
  final Stock item;

  const CompanyCard({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.read(selectedSymbolProvider.notifier).state = item.symbol;
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const StockChartScreen();
        }));
      },
      child: SizedBox(
        height: 80,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(item.logoUrl, width: 40, height: 40),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.companyName,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      '${item.exchange}: ${item.symbol}',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    // Uncomment if you want to include the last updated info
                    // Text(
                    //   'Last updated: ${DateFormat.yMd().add_jm().format(item.lastUpdated)}',
                    //   style: Theme.of(context).textTheme.bodySmall,
                    // ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '\$${item.currentPrice}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Row(children: [
                    Text(
                      '${item.percentageChange}%',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: double.parse(item.percentageChange) >= 0
                                ? Colors.green
                                : Colors.red,
                          ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      double.parse(item.percentageChange) >= 0
                          ? Icons.arrow_upward
                          : Icons.arrow_downward,
                      size: 12,
                      color: double.parse(item.percentageChange) >= 0
                          ? Colors.green
                          : Colors.red,
                    )
                  ]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
