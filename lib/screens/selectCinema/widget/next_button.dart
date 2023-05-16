import 'package:flutter/material.dart';

import '../../../themes/app_colors.dart';
import '../../../utils/constants.dart';
import '../../../utils/helper.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: kDefaultPadding),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          // backgroundColor: AppColors.grey,
          padding: const EdgeInsets.all(kTopPadding),
        ),
        child: const ImageIcon(
          AssetImage(AssetHelper.icoNext),
          color: AppColors.white,
          size: kTop32Padding,
        ),
      ),
    );
  }
}
