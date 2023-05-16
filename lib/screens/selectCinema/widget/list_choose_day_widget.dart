import 'package:flutter/material.dart';

import '../../../models/movie.dart';
import '../../../themes/app_styles.dart';
import '../../../utils/constants.dart';
import 'get_color_state.dart';

class ListChooseDay extends StatelessWidget {
  const ListChooseDay({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: days
            .map(
              (e) => Builder(
                builder: (context) {
                  return Container(
                    height: size.height / 8,
                    width: size.width / 5.5,
                    margin: const EdgeInsets.only(right: kDefaultPadding),
                    decoration: BoxDecoration(
                      borderRadius: kDefaultBorderRadius,
                      color: getColor(dayStates[days.indexOf(e)]),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          e,
                          style: AppStyles.h4,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: kMinPadding),
                          child: Text(
                            (20 + days.indexOf(e)).toString(),
                            style: AppStyles.h5,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
