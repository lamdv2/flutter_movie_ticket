import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final String imgPath;
  final Function()? onTap;

  const SquareTile({Key? key, required this.imgPath, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Image(
          image: AssetImage(
            imgPath,
          ),
          height: 38,
        ),
      ),
    );
  }
}
