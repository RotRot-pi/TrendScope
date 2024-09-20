import 'package:flutter/material.dart';

import 'package:trendscope/domain/model/stocks_response.dart';
import 'package:trendscope/presentation/market/widgets/company_card.dart';

class CompaniesCardsList extends StatelessWidget {
  const CompaniesCardsList({
    super.key,
    required this.stocks,
  });

  final List<Stock> stocks;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: stocks.length,
      itemBuilder: (context, index) {
        final item = stocks[index];
        return CompanyCard(item: item);
      },
    );
  }
}
