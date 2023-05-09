import 'package:flutter/material.dart';

class FontFamily {
  static const mont = 'montserrat';
}

class AppStyles {
  static TextStyle h1 = const TextStyle(
      fontFamily: FontFamily.mont, fontSize: 32.00, color: Colors.white);
  static TextStyle h2 = const TextStyle(
      fontFamily: FontFamily.mont, fontSize: 24.00, color: Colors.white);
  static TextStyle h3 = const TextStyle(
      fontFamily: FontFamily.mont, fontSize: 18.72, color: Colors.white);
  static TextStyle h4 = const TextStyle(
      fontFamily: FontFamily.mont, fontSize: 16.00, color: Colors.white);
  static TextStyle h5 = const TextStyle(
      fontFamily: FontFamily.mont, fontSize: 13.28, color: Colors.white);
  static TextStyle h5Light = const TextStyle(
      fontFamily: FontFamily.mont, fontSize: 12, color: Colors.white70, fontWeight: FontWeight.normal);
  static TextStyle h6 = const TextStyle(
      fontFamily: FontFamily.mont, fontSize: 10.72, color: Colors.white);
}