import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trendscope/core/colors.dart';
import 'package:trendscope/domain/model/stocks_response.dart';
import 'package:trendscope/presentation/market/widgets/companies_card_list.dart';

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
