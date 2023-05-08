import 'package:flutter/material.dart';

import '../../../themes/app_colors.dart';
import '../../../themes/app_styles.dart';
import '../../../utils/constants.dart';

class AboutText extends StatelessWidget {
  const AboutText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: kMediumPadding,
        top: kTopPadding,
        right: kMediumPadding,
      ),
      child: Text(
        text,
        style: AppStyles.h4.copyWith(
          color: AppColors.grey,
        ),
      ),
    );
  }
}
