import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:trendscope/core/colors.dart';
import 'package:trendscope/domain/model/stocks_response.dart';
import 'package:trendscope/presentation/market/provider/market_provider.dart';
import 'package:trendscope/presentation/stock_chart/view/stock_chart_view.dart';

class MarketView extends ConsumerWidget {
  const MarketView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final marketData = ref.watch(marketDataProvider);

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            'MARKET',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          const BackgroundWidget(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const TopButtonsList(),
              MarketList(marketData: marketData),
            ],
          ),
        ],
      ),
    );
  }
}

class TopButtonsList extends StatefulWidget {
  const TopButtonsList({Key? key}) : super(key: key);

  @override
  _TopButtonsListState createState() => _TopButtonsListState();
}

class _TopButtonsListState extends State<TopButtonsList> {
  String activeButton = 'Most Viewed';

  void setActiveButton(String title) {
    setState(() {
      activeButton = title;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TopButton(
            title: 'Most Viewed',
            isActive: activeButton == 'Most Viewed',
            onTap: setActiveButton,
          ),
          TopButton(
            title: 'Top Gainers',
            isActive: activeButton == 'Top Gainers',
            onTap: setActiveButton,
          ),
          TopButton(
            title: 'Top Losers',
            isActive: activeButton == 'Top Losers',
            onTap: setActiveButton,
          ),
        ],
      ),
    );
  }
}

class TopButton extends StatelessWidget {
  const TopButton({
    super.key,
    required this.title,
    required this.isActive,
    required this.onTap,
  });

  final String title;
  final bool isActive;
  final Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(title),
      child: Container(
        decoration: BoxDecoration(
          color: isActive ? primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: isActive ? whiteColor : primaryColor,
                fontWeight: FontWeight.w500,
                fontSize: 14),
          ),
        ),
      ),
    );
  }
}

class MarketList extends StatelessWidget {
  const MarketList({
    super.key,
    required this.marketData,
  });

  final AsyncValue<StocksResponse> marketData;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Container(
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: greyColor.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: marketData.when(
            data: (data) {
              return CompaniesCardsList(data: data);
            },
            error: (error, stackTrace) => Text('Error: $error'),
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
        ),
      ),
    );
  }
}

class CompaniesCardsList extends StatelessWidget {
  const CompaniesCardsList({
    super.key,
    required this.data,
  });

  final StocksResponse data;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.stocks.length,
      itemBuilder: (context, index) {
        final item = data.stocks[index];
        return CompanyCard(item: item);
      },
    );
  }
}

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            color: whiteColor.withAlpha(200),
          ),
        ),
        Expanded(
          flex: 4,
          child: Container(
            color: accentGreyColor.withAlpha(200),
          ),
        ),
      ],
    );
  }
}

class CompanyCard extends StatelessWidget {
  final Stock item;

  const CompanyCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const StockChartView(),
                settings: RouteSettings(arguments: item.symbol)));
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
