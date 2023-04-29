import 'package:flutter/material.dart';
import 'package:movie_ticket/screens/home/home_screen.dart';
import 'package:movie_ticket/screens/profile/profile_screen.dart';

final Map<String, WidgetBuilder> routes = {
  ProfileScreen.routeName: (context) => const ProfileScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
};