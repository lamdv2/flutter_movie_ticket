import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_ticket/themes/app_colors.dart';
import 'package:movie_ticket/themes/app_styles.dart';
import 'package:movie_ticket/utils/constants.dart';

class SelectCinemaPage extends StatefulWidget {
  const SelectCinemaPage({Key? key}) : super(key: key);

  static const String routeName = '/select_cinema_page';

  @override
  State<SelectCinemaPage> createState() => _SelectCinemaPageState();
}

class _SelectCinemaPageState extends State<SelectCinemaPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: size.height / 10,
                  child: Center(
                    child: Text(
                      'Ralph Breaks the\nInternet',
                      style: AppStyles.h2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                    left: kDefaultPadding,
                    top: kMinPadding,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const FaIcon(
                      FontAwesomeIcons.arrowLeft,
                      color: AppColors.white,
                      size: 20,
                    ),
                  ),
                )
              ],
            ),
            Container(
              height: size.height / 14,
              margin: const EdgeInsets.symmetric(
                vertical: kMediumPadding,
                horizontal: kDefaultIconSize,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.white),
                borderRadius: kSmallBorderRadius,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
