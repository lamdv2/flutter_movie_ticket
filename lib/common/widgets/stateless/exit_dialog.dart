import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../themes/app_colors.dart';

class ExitDialog extends StatelessWidget {
  const ExitDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Thoát ứng dụng',
          style: TextStyle(color: AppColors.darkerBackground)),
      content: const Text('Bạn có chắc muốn thoát ứng dụng?',
          style: TextStyle(color: AppColors.darkerBackground)),
      actions: [
        TextButton(
          child: const Text('Không',
              style: TextStyle(color: AppColors.darkerBackground)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('Có',
              style: TextStyle(color: AppColors.darkerBackground)),
          onPressed: () {
            SystemNavigator.pop();
          },
        ),
      ],
    );
  }
}
