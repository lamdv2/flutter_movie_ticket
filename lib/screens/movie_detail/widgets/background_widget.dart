import 'package:flutter/material.dart';

import '../../../themes/app_colors.dart';
import '../../../utils/helper.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Text('${movie!.name}'),
        Container(
          height: size.height / 3,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AssetHelper.imgMovieBanner),
              fit: BoxFit.cover,
            ),
            gradient: LinearGradient(
              colors: [
                AppColors.greyBackground,
                AppColors.darkerBackground,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        // Container(
        //   height: size.height / 3*2,
        //   decoration: const BoxDecoration(
        //     gradient: LinearGradient(
        //       colors: [
        //
        //         AppColors.darkerBackground,
        //         Gradients.darkGreyMid,
        //       ],
        //       begin: Alignment.topCenter,
        //       end: Alignment.bottomCenter,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}