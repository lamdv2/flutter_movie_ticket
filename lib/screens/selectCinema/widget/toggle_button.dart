import 'package:flutter/material.dart';
import 'package:movie_ticket/models/movie.dart';

import '../../../themes/app_colors.dart';
import '../../../utils/constants.dart';

class ToggleButton extends StatefulWidget {
  const ToggleButton({
    super.key,
    required this.child,
    this.margin,
  });

  final Widget child;
  final double? margin;

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  TicketStates _ticketStates = TicketStates.idle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _ticketStates = _ticketStates == TicketStates.idle ?
          TicketStates.active : TicketStates.idle;
        });
      },
      child: Container(
        height: 36,
        width: 36,
        margin: widget.margin != null
            ? const EdgeInsets.only(right: 30)
            : const EdgeInsets.only(right: 0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: _ticketStates == TicketStates.idle ?
          AppColors.greyBackground : AppColors.blueMain,
          borderRadius: kSmallBorderRadius,
        ),
        child: widget.child,
      ),
    );
  }
}
