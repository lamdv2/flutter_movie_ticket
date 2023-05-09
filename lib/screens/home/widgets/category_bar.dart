import 'package:flutter/material.dart';

import '../../../models/movie.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/app_styles.dart';
import '../../../utils/constants.dart';

class CategoryBar extends StatefulWidget {
  const CategoryBar({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  State<CategoryBar> createState() => _CategoryBarState();
}

class _CategoryBarState extends State<CategoryBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: kTopPadding, right: kDefaultPadding, bottom: kMediumPadding),
      child: SizedBox(
        height: widget.size.height / 15,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movies.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                width: widget.size.width / 5,
                alignment: Alignment.center,
                margin: const EdgeInsets.only(left: kDefaultPadding),
                decoration: selectedIndex == index
                    ? const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Gradients.lightBlue1,
                            Gradients.lightBlue2,
                          ],
                        ),
                        borderRadius: kDefaultBorderRadius,
                      )
                    : const BoxDecoration(
                        color: AppColors.darkBackground,
                        borderRadius: kDefaultBorderRadius,
                      ),
                child: Text(
                  movies[index].getType(),
                  style: AppStyles.h4,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}


