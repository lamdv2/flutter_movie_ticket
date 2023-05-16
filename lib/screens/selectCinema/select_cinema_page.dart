import 'package:flutter/material.dart';
import 'package:movie_ticket/common/widgets/stateful/title.dart';
import 'package:movie_ticket/screens/selectCinema/select_seat_page.dart';
import 'package:movie_ticket/screens/selectCinema/widget/custom_header.dart';
import 'package:movie_ticket/screens/selectCinema/widget/list_choose_day_widget.dart';
import 'package:movie_ticket/screens/selectCinema/widget/next_button.dart';
import 'package:movie_ticket/screens/selectCinema/widget/select_country.dart';
import 'package:movie_ticket/screens/selectCinema/widget/time_available_widget.dart';
import 'package:movie_ticket/utils/constants.dart';

import '../../models/movie.dart';

class SelectCinemaPage extends StatefulWidget {
  const SelectCinemaPage({Key? key}) : super(key: key);

  static const String routeName = '/select_cinema_page';

  @override
  State<SelectCinemaPage> createState() => _SelectCinemaPageState();
}

class _SelectCinemaPageState extends State<SelectCinemaPage> {
  final List<String> items = [
    'Japan',
    'VietNam',
    'China',
    'Thailand',
  ];

  @override
  Widget build(BuildContext context) {
    Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomHeader(size: size, content: movie.name.toString()),
            SelectCountry(
              size: size,
              items: items,
            ),
            const TitleHome(title: 'Choose Day'),
            const SizedBox(
              height: kDefaultPadding,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kMediumPadding),
              child: ListChooseDay(size: size),
            ),
            const TitleHome(title: 'Central Park CGV'),
            TimeAvailable(size: size, dayState: dayStates),
            const TitleHome(title: 'FX Sudirman XXI'),
            TimeAvailable(size: size, dayState: dayStates1),
            const TitleHome(title: 'Kelapa Gading IMAX'),
            TimeAvailable(size: size, dayState: dayStates2),
            NextButton(
              onTap: () {
                Navigator.of(context).pushNamed(SelectSeatPage.routeName, arguments: movie);
              },
            ),
          ],
        ),
      ),
    );
  }
}
