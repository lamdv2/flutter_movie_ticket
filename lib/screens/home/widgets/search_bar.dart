import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../themes/app_colors.dart';
import '../../../themes/app_styles.dart';
import '../../../utils/constants.dart';
import '../../../utils/helper.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kMediumPadding),
      child: SizedBox(
        height: size.height / 15,
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: size.height / 15,
                margin: const EdgeInsets.only(right: kDefaultPadding),
                decoration: const BoxDecoration(
                  color: AppColors.darkBackground,
                  borderRadius: kBigBorderRadius,
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: kMediumPadding, right: kMediumPadding),
                      child: GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          FontAwesomeIcons.search,
                          size: kDefaultIconSize,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        style: AppStyles.h3,
                        decoration: InputDecoration(
                          hintText: 'Search Movie',
                          hintStyle:
                              AppStyles.h3.copyWith(color: AppColors.grey),
                          fillColor: Colors.lightBlue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: size.height / 15,
              width: size.height / 15,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.blueIllustration,
                    AppColors.blueMain,
                  ],
                ),
                borderRadius: kDefaultBorderRadius,
              ),
              child: Image.asset(
                AssetHelper.icoControl,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
