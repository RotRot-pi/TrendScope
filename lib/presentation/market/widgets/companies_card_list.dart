import 'package:flutter/material.dart';

import 'package:trendscope/domain/model/stocks_response.dart';
import 'package:trendscope/presentation/market/widgets/company_card.dart';

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
