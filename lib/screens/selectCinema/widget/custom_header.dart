import 'package:flutter/material.dart';

import '../../../common/widgets/stateless/arrow_back_button.dart';
import '../../../themes/app_styles.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({
    super.key,
    required this.size,
    required this.content,
  });

  final Size size;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: size.height / 10,
          child: Center(
            child: Text(
              content ?? 'Null',
              style: AppStyles.h2,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        ArrowBackButton(topPadding: 0),
      ],
    );
  }
}
