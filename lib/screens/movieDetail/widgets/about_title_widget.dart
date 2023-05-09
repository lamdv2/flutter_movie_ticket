import 'package:flutter/material.dart';

import '../../../themes/app_styles.dart';
import '../../../utils/constants.dart';

class AboutTitle extends StatelessWidget {
  const AboutTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: kTop32Padding,
        left: kMediumPadding,
        bottom: kTopPadding,
      ),
      child: Text(
        title,
        style: AppStyles.h3,
      ),
    );
  }
}