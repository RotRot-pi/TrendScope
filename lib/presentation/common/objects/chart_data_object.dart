class ChartData {
  final DateTime date;
  final double open;
  final double high;
  final double low;
  final double close;
  final double volume;
  final String symbol;

  ChartData({
    required this.date,
    required this.open,
    required this.high,
    required this.low,
    required this.close,
    required this.volume,
    required this.symbol,
  });
}
