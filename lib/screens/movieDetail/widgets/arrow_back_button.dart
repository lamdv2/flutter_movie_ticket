import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../themes/app_colors.dart';
import '../../../utils/constants.dart';

class ArrowBackButton extends StatelessWidget {
  const ArrowBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.only(top: kTop32Padding, left: kTopPadding),
      child: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const FaIcon(
          FontAwesomeIcons.arrowLeft,
          color: AppColors.white,
        ),
      ),
    );
  }
}