import 'package:flutter/material.dart';
import 'package:trendscope/core/colors.dart';

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
