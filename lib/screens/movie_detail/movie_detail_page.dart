import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_ticket/models/movie.dart';
import 'package:movie_ticket/screens/movie_detail/widgets/arrow_back_button.dart';
import 'package:movie_ticket/screens/movie_detail/widgets/background_widget.dart';
import 'package:movie_ticket/themes/app_colors.dart';
import 'package:movie_ticket/utils/constants.dart';
import 'package:movie_ticket/utils/helper.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({Key? key}) : super(key: key);

  static const String routeName = '/movie_detail_page';

  @override
  Widget build(BuildContext context) {
    Movie? movie = ModalRoute.of(context)!.settings.arguments as Movie?;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            BackgroundWidget(size: size),
            Container(
              height: size.height / 3,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Gradients.darkGreyMid,
                    AppColors.darkerBackground,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            const ArrowBackButton(),
          ],
        ),
      ),
    );
  }
}




