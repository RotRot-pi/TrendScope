import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trendscope/presentation/stock_chart/provider/stock_chart_provider.dart';
import 'package:trendscope/presentation/stock_chart/widgets/stock_chart_widget.dart';

class StockChartView extends ConsumerWidget {
  const StockChartView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String symbol = ModalRoute.of(context)?.settings.arguments as String;
    final stockData = ref.watch(stockChartProvider(symbol));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stock Chart'),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height / 3,
        child: stockData.when(
          data: (data) {
            print("Data Length: ${data.timeSeriesDaily.values.first}");
            print("Min Date: ${data.timeSeriesDaily.keys.first}");
            print("Max Date: ${data.timeSeriesDaily.keys.last}");

            List<String> dates = data.timeSeriesDaily.keys.toList();
            //last 7 days
            var min = DateTime.parse(dates[dates.length - 9]);
            var max = DateTime.parse(dates[dates.length - 1]);

            var minVolume = data.timeSeriesDaily.values
                .skip(dates.length - 9)
                .reduce((curr, next) =>
                    double.parse(curr.volume) < double.parse(next.volume)
                        ? curr
                        : next)
                .volume;
            var maxVolume = data.timeSeriesDaily.values
                .skip(dates.length - 9)
                .reduce((curr, next) =>
                    double.parse(curr.volume) > double.parse(next.volume)
                        ? curr
                        : next)
                .volume;
            return StockChartWidget(
              data: data,
              maxVolume: maxVolume,
              min: min,
              max: max,
            );
          },
          error: (error, stackTrace) => Center(child: Text(error.toString())),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
