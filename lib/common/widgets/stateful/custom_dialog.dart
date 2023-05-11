import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String message;

  const CustomDialog({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue,
      title: Text(
        message,
        style: const TextStyle(color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }
}
