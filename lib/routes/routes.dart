import 'package:flutter/material.dart';
import 'package:movie_ticket/screens/checkout/check_out.dart';
import 'package:movie_ticket/screens/home/home_page.dart';
import 'package:movie_ticket/screens/login/auth_page.dart';
import 'package:movie_ticket/screens/profile/profile_page.dart';
import 'package:movie_ticket/screens/selectCinema/select_cinema_page.dart';
import 'package:movie_ticket/screens/selectCinema/select_seat_page.dart';

import '../screens/movieDetail/movie_detail_page.dart';

final Map<String, WidgetBuilder> routes = {
  ProfileScreen.routeName: (context) => const ProfileScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  MovieDetailPage.routeName: (context) => const MovieDetailPage(),
  SelectCinemaPage.routeName: (context) => const SelectCinemaPage(),
  AuthPage.routeName: (context) => const AuthPage(),
  SelectSeatPage.routeName: (context) => const SelectSeatPage(),
  CheckOut.routeName: (context) => const CheckOut(),
};
