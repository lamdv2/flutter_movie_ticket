import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../themes/app_colors.dart';
import '../../../utils/constants.dart';

class StarWidget extends StatelessWidget {
  const StarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(right: kMinPadding),
      child: FaIcon(
        FontAwesomeIcons.solidStar,
        color: AppColors.yellow,
        size: 16,
      ),
    );
  }
}
