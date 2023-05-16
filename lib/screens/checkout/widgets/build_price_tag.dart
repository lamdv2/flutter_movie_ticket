import 'package:flutter/material.dart';

import '../../../themes/app_colors.dart';
import '../../../themes/app_styles.dart';
import '../../../utils/constants.dart';

class BuildPriceTag extends StatelessWidget {
  const BuildPriceTag({
    super.key,
    required this.content,
    required this.price,
  });

  final String content;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: kItemPadding, horizontal: kMediumPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            content,
            style: AppStyles.h4.copyWith(color: AppColors.grey),
          ),
          Text(
            price,
            style: AppStyles.h4,
          )
        ],
      ),
    );
  }
}