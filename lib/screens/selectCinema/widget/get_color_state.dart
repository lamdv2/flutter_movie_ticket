import 'dart:ui';

import '../../../models/movie.dart';
import '../../../themes/app_colors.dart';

Color getColor(TicketStates state) {
  switch (state) {
    case TicketStates.idle:
      return AppColors.darkBackground;
    case TicketStates.active:
      return AppColors.blueMain;
    case TicketStates.busy:
      return AppColors.greyBackground;
  }
}