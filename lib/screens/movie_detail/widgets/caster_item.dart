import 'dart:math';

import 'package:flutter/material.dart';
import 'package:movie_ticket/models/cast.dart';

import '../../../themes/app_styles.dart';
import '../../../utils/constants.dart';

class CasterItem extends StatelessWidget {
  const CasterItem({
    super.key,
    required this.size,
    required this.casters,
  });

  final Size size;
  final Cast casters;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: kDefaultPadding,
            top: kMinPadding,
          ),
          child: Container(
            width: size.width / 4.5,
            height: size.height / 6.5,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(casters.profileImgCast),
                ),
                borderRadius: kBigBorderRadius),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: kDefaultPadding),
          child: Text(casters.nameCast, style: AppStyles.h5Light),
        ),
      ],
    );
  }
}
