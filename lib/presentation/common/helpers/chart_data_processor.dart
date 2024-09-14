import 'dart:math' as math;
import 'package:trendscope/core/enums.dart';
import 'package:trendscope/presentation/common/helpers/stock_chart_helper.dart';
import 'package:trendscope/presentation/common/objects/chart_config.dart';
import 'package:trendscope/presentation/common/objects/chart_data_object.dart';

class ChartDataProcessor {
  static ChartConfig calculateChartConfig(
    List<ChartData> chartData,
    ChartTimeFrame selectedTimeFrame,
    String selectedPeriod,
  ) {
    DateTime minimumDate = chartData.last.date;
    DateTime maximumDate = chartData.first.date;

    minimumDate = StockChartHelpers.calculateMinimumDate(
            maximumDate, minimumDate, selectedPeriod)
        .$1;
    maximumDate = maximumDate
        .add(StockChartHelpers.getDateTimePadding(selectedTimeFrame));

    List<ChartData> visibleData;
    if (selectedPeriod != 'Last Day') {
      visibleData = chartData
          .where((data) =>
              data.date.isAfter(minimumDate) && data.date.isBefore(maximumDate))
          .toList();
    } else {
      visibleData =
          chartData.where((data) => data.date.isAfter(minimumDate)).toList();
    }

    double minPrice = visibleData.map((e) => e.low).reduce(math.min);
    double maxPrice = visibleData.map((e) => e.high).reduce(math.max);

    if (selectedPeriod != 'Last Day') {
      final pricePadding = (maxPrice - minPrice) * 0.1;
      minPrice -= pricePadding;
      maxPrice += pricePadding;
    }

    return ChartConfig(
      minimumDate: minimumDate,
      maximumDate: maximumDate,
      minPrice: minPrice,
      maxPrice: maxPrice,
      dateFormat: StockChartHelpers.getDateFormat(selectedTimeFrame),
    );
  }
}
