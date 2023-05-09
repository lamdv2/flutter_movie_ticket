import 'package:flutter/material.dart';

import '../../../models/movie.dart';
import '../../../themes/app_colors.dart';
import '../../../utils/constants.dart';
import '../../../utils/helper.dart';

class TrailerBar extends StatelessWidget {
  const TrailerBar({
    super.key,
    required this.movie,
    required this.size,
  });

  final Movie? movie;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(
          top: kDefaultPadding,
          right: kDefaultPadding,
        ),
        child: Row(
          children: movie!.trailers!
              .map((e) => Builder(
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.only(left: kDefaultPadding),
                child: Stack(
                  children: [
                    Container(
                      height: size.height / 4.5,
                      width: size.width / 1.5,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(e),
                            fit: BoxFit.cover),
                        borderRadius:
                        kDefaultBorderRadius,
                      ),
                    ),
                    Container(
                      height: size.height / 4.5,
                      width: size.width / 1.5,
                      decoration: const BoxDecoration(
                        color: Gradients.darkGreyMid,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Play Movie Trailer
                      },
                      child: SizedBox(
                        height: size.height / 4.5,
                        width: size.width / 1.5,
                        child: Container(
                          margin: EdgeInsets.all(size.width / 7),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.blueMain,
                          ),
                          child: const ImageIcon(
                            AssetImage(AssetHelper.icoPlay),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
          ).toList()),
      ),
    );
  }
}