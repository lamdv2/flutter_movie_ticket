import 'package:flutter/material.dart';

import '../../../models/movie.dart';
import '../../../themes/app_styles.dart';
import '../../../utils/constants.dart';
import 'get_color_state.dart';

class TimeAvailable extends StatelessWidget {
  TimeAvailable({
    super.key,
    required this.size,
    required this.dayState,
  });

  final Size size;
  List<TicketStates> dayState;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height / 15,
      margin:
      const EdgeInsets.only(top: kItemPadding, left: kTopPadding),
      child: ListView.builder(
        itemBuilder: (context, index) => Container(
          width: size.width / 4,
          margin: const EdgeInsets.only(left: kDefaultPadding),
          decoration: BoxDecoration(
            color: getColor(dayState[index]),
            borderRadius: kDefaultBorderRadius,
          ),
          alignment: Alignment.center,
          child: Text(
            times[index],
            style: AppStyles.h4,
          ),
        ),
        itemCount: times.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}