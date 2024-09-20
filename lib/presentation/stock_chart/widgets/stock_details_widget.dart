import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StockDetailWidget extends StatelessWidget {
  const StockDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: DefaultTabController(
        length: 4,
        child: Column(children: [
          const TabBar(
            tabs: [
              Tab(text: 'News'),
              Tab(text: 'Metrics'),
              Tab(text: 'Ratings'),
              Tab(text: 'Events'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                _buildNewsTab(context),
                _buildMetricsTab(),
                _buildRatingsTab(context),
                _buildEventsTab(),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget _buildNewsTab(BuildContext context) {
    final newsData = [
      {
        'headline': 'Apple Announces New iPhone 16 Series',
        'summary':
            'Apple unveils its latest iPhone lineup with advanced AI capabilities and improved battery life.',
      },
      {
        'headline': "Apple's Services Revenue Hits New Record",
        'summary':
            "The tech giant's services segment, including Apple Music and iCloud, shows strong growth in Q3 2024.",
      },
    ];

    return ListView.builder(
      itemCount: newsData.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  newsData[index]['headline']!,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 8),
                Text(newsData[index]['summary']!),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildMetricsTab() {
    final keyMetrics = {
      'Market Cap': '2.78T',
      'P/E Ratio': '28.5',
      'Dividend Yield': '0.55%',
      '52 Week High': '\$182.94',
      '52 Week Low': '\$124.17',
    };

    return ListView(
      children: keyMetrics.entries.map((entry) {
        return Card(
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(entry.key),
            trailing: Text(
              entry.value,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildRatingsTab(BuildContext context) {
    final analystRatings = {'Buy': 28, 'Hold': 7, 'Sell': 2};
    final totalRatings = analystRatings.values.reduce((a, b) => a + b);

    return Column(
      children: [
        Expanded(
          child: Center(
            child: SfCircularChart(
              series: <CircularSeries>[
                PieSeries<MapEntry<String, int>, String>(
                  dataSource: analystRatings.entries.toList(),
                  xValueMapper: (MapEntry<String, int> entry, _) => entry.key,
                  yValueMapper: (MapEntry<String, int> entry, _) =>
                      entry.value.toDouble(),
                  dataLabelMapper: (MapEntry<String, int> entry, _) =>
                      '${entry.key}\n${entry.value}',
                  pointColorMapper: (MapEntry<String, int> entry, _) =>
                      _getRatingColor(entry.key),
                  dataLabelSettings: const DataLabelSettings(
                    isVisible: true,
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  radius: '100%', // similar to the radius setting
                ),
              ],
              centerY: '50%',
              centerX: '50%',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Total Ratings: $totalRatings',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
      ],
    );
  }

  Widget _buildEventsTab() {
    final upcomingEvents = [
      {'event': 'Q4 2024 Earnings Call', 'date': '2024-10-25'},
      {'event': 'Annual Shareholders Meeting', 'date': '2025-02-15'},
    ];

    return ListView.builder(
      itemCount: upcomingEvents.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: const Icon(Icons.event),
            title: Text(upcomingEvents[index]['event']!),
            subtitle: Text(
              DateFormat('MMMM d, y')
                  .format(DateTime.parse(upcomingEvents[index]['date']!)),
            ),
          ),
        );
      },
    );
  }

  Color _getRatingColor(String rating) {
    switch (rating) {
      case 'Buy':
        return Colors.green;
      case 'Hold':
        return Colors.orange;
      case 'Sell':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
