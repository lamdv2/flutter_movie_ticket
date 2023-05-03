import 'package:flutter/material.dart';

import '../../../themes/app_colors.dart';
import '../../../themes/app_styles.dart';
import '../../../utils/constants.dart';

class Promo extends StatelessWidget {
  const Promo({
    super.key,
    required this.size,
    required this.content,
    required this.title,
    required this.discount,
  });

  final Size size;
  final String content;
  final String title;
  final String discount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Container(
        height: size.height / 8,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Gradients.promo1,
              Gradients.promo2,
            ],
          ),
          borderRadius: kBigBorderRadius,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(left: kDefaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(content, style: AppStyles.h4),
                    Text(title, style: AppStyles.h4.copyWith(color: AppColors.grey),),
                  ],
                ),
              ),
            ),
            Expanded(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'OFF ',
                      style: AppStyles.h4,
                    ),
                    TextSpan(
                      text: discount,
                      style: AppStyles.h4.copyWith(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
