import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_ticket/models/movie.dart';
import 'package:movie_ticket/screens/home/widgets/carousel_slide.dart';
import 'package:movie_ticket/screens/home/widgets/category_bar.dart';
import 'package:movie_ticket/screens/home/widgets/coming_soon.dart';
import 'package:movie_ticket/screens/home/widgets/home_header.dart';
import 'package:movie_ticket/screens/home/widgets/promo.dart';
import 'package:movie_ticket/screens/home/widgets/search_bar.dart';
import 'package:movie_ticket/screens/home/widgets/title.dart';
import 'package:movie_ticket/themes/app_colors.dart';
import 'package:movie_ticket/themes/app_styles.dart';
import 'package:movie_ticket/utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final user = FirebaseAuth.instance.currentUser!;
final userName = user.email.toString().substring(0, 3);

void signUserOut() {
  FirebaseAuth.instance.signOut();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Movie> movies = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadMovies();
  }

  void _loadMovies() {
    setState(() {
      movies = addListMovie(movies);
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeHeader(size: size),
            SearchBar(size: size),
            CategoryBar(
              size: size,
              genres: movies,
            ),
            const TitleHome(title: 'Now Playing'),
            CarouselSliderFirm(
              size: size,
              movies: movies,
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: kTop32Padding,
                bottom: kMediumPadding,
              ),
              child: TitleHome(title: 'Coming Soon'),
            ),
            ComingSoon(
              movies: movies,
            ),
            const TitleHome(title: 'Promo'),
            Promo(
              size: size,
              content: 'Student Holiday',
              title: 'Maximal only for two people',
              discount: '50%',
            ),
            Promo(
              size: size,
              content: 'ThankGiving Holiday',
              title: 'Maximal only for five people',
              discount: '20%',
            ),
            Promo(
              size: size,
              content: 'Winter Holiday',
              title: 'Maximal only for eight people',
              discount: '10%',
            ),
          ],
        ),
      ),
    );
  }
}
