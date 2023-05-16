import 'package:flutter/material.dart';
import 'package:movie_ticket/screens/selectCinema/select_cinema_page.dart';

import '../../../models/movie.dart';
import '../../../utils/constants.dart';

class ComingSoon extends StatelessWidget {
  ComingSoon({
    super.key,
    required this.movies,
  });

  List<Movie> movies = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: kDefaultPadding,
        right: kDefaultPadding,
        top: kTopPadding,
        bottom: kMediumPadding,
      ),
      child: Row(
        children: movies
            .take(3)
            .map((e) => Builder(builder: (context) {
          return Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(SelectCinemaPage.routeName, arguments: e);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: kTopPadding,
                ),
                child: Image.asset(e.background.toString()),
              ),
            ),
          );
        }))
            .toList(),
      ),
    );
  }
}