import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trendscope/domain/model/stocks_response.dart';
import 'package:trendscope/presentation/stock_chart/provider/stock_chart_provider.dart';
import 'package:trendscope/presentation/stock_chart/view/stock_chart_screen.dart';

// class CompanyCard extends ConsumerWidget {
//   final Stock item;

//   const CompanyCard({super.key, required this.item});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return GestureDetector(
//       onTap: () {
//         ref.read(selectedSymbolProvider.notifier).state = item.symbol;
//         Navigator.push(context, MaterialPageRoute(builder: (context) {
//           return const StockChartScreen();
//         }));
//       },
//       child: SizedBox(
//         height: 80,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               CachedNetworkImage(
//                 imageUrl: item.logoUrl,
//                 width: 40,
//                 height: 40,
//               ),
//               const SizedBox(width: 16),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                       item.companyName,
//                       style: Theme.of(context).textTheme.titleMedium,
//                     ),
//                     Text(
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                       '${item.exchange}: ${item.symbol}',
//                       style: Theme.of(context).textTheme.titleSmall,
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(width: 16),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     '\$${item.currentPrice}',
//                     style: Theme.of(context).textTheme.titleMedium,
//                   ),
//                   Row(children: [
//                     Text(
//                       '${item.percentageChange}%',
//                       style: Theme.of(context).textTheme.titleSmall!.copyWith(
//                             color: double.parse(item.percentageChange) >= 0
//                                 ? Colors.green
//                                 : Colors.red,
//                           ),
//                     ),
//                     const SizedBox(width: 4),
//                     Icon(
//                       double.parse(item.percentageChange) >= 0
//                           ? Icons.arrow_upward
//                           : Icons.arrow_downward,
//                       size: 12,
//                       color: double.parse(item.percentageChange) >= 0
//                           ? Colors.green
//                           : Colors.red,
//                     )
//                   ]),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
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
              // Display the logo if available
              if (item.logoUrl.isNotEmpty)
                CachedNetworkImage(
                    imageUrl: item.logoUrl, width: 40, height: 40)
              else
                const SizedBox(width: 40, height: 40), // Placeholder if no logo

              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      item.companyName,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    // Display type and region instead of exchange and symbol
                    Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      '${item.type} - ${item.region}',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Display price if available
                  if (item.currentPrice.isNotEmpty)
                    Text(
                      '\$${item.currentPrice}',
                      style: Theme.of(context).textTheme.titleMedium,
                    )
                  else
                    const SizedBox.shrink(), // Don't display if no price

                  // Display percentage change with arrow
                  if (item.percentageChange.isNotEmpty)
                    Row(children: [
                      Text(
                        '${item.percentageChange}%',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color:
                                  double.tryParse(item.percentageChange)! >= 0
                                      ? Colors.green
                                      : Colors.red,
                            ),
                      ),
                      const SizedBox(width: 4),
                      Icon(
                        double.tryParse(item.percentageChange)! >= 0
                            ? Icons.arrow_upward
                            : Icons.arrow_downward,
                        size: 12,
                        color: double.tryParse(item.percentageChange)! >= 0
                            ? Colors.green
                            : Colors.red,
                      )
                    ])
                  else
                    const SizedBox
                        .shrink(), // Don't display if no percentage change
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
