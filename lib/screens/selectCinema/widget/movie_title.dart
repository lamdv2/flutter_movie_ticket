import 'package:flutter/material.dart';

import '../../../themes/app_colors.dart';
import '../../../themes/app_styles.dart';
import '../../../utils/constants.dart';

class MovieTitle extends StatelessWidget {
  const MovieTitle({
    super.key,
    required this.nameMovie,
  });

  final String nameMovie;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: kMediumPadding),
          child: Text(
            nameMovie,
            style: AppStyles.h2,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: kMediumPadding),
          child: Text(
            'FX Sudirman XXI',
            style: AppStyles.h4.copyWith(
              fontWeight: FontWeight.w400,
              color: AppColors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
