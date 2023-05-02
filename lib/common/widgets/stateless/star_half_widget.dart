import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../themes/app_colors.dart';
import '../../../utils/constants.dart';

class StarHalfWidget extends StatelessWidget {
  const StarHalfWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(right: kMinPadding),
      child: FaIcon(
        FontAwesomeIcons.starHalfStroke,
        color: AppColors.yellow,
        size: 16,
      ),
    );
  }
}
