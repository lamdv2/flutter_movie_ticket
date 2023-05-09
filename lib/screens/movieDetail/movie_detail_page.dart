import 'package:flutter/material.dart';
import 'package:movie_ticket/common/widgets/stateful/list_star_widget.dart';
import 'package:movie_ticket/models/movie.dart';
import 'package:movie_ticket/screens/movieDetail/widgets/about_text_widget.dart';
import 'package:movie_ticket/screens/movieDetail/widgets/about_title_widget.dart';
import 'package:movie_ticket/screens/movieDetail/widgets/arrow_back_button.dart';
import 'package:movie_ticket/screens/movieDetail/widgets/background_widget.dart';
import 'package:movie_ticket/screens/movieDetail/widgets/caster_bar.dart';
import 'package:movie_ticket/screens/movieDetail/widgets/trailer_bar.dart';
import 'package:movie_ticket/themes/app_colors.dart';
import 'package:movie_ticket/themes/app_styles.dart';
import 'package:movie_ticket/utils/constants.dart';
import 'package:movie_ticket/utils/helper.dart';

class MovieDetailPage extends StatefulWidget {
  const MovieDetailPage({Key? key}) : super(key: key);

  static const String routeName = '/movie_detail_page';

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Movie? movie = ModalRoute.of(context)!.settings.arguments as Movie?;
    Size size = MediaQuery.of(context).size;

    const List<Tab> tab = [
      Tab(text: 'About Movie'),
      Tab(text: 'Review'),
    ];

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
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
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: kMediumPadding,
                    top: size.height / 4,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: size.width / 2.5,
                        child: Image.asset(
                          AssetHelper.imgRalph,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                left: kDefaultPadding,
                                bottom: kDefaultPadding,
                              ),
                              width: size.width,
                              child: Text(
                                '${movie!.name}',
                                style: AppStyles.h3,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                left: kDefaultPadding,
                                bottom: kDefaultPadding,
                              ),
                              width: size.width,
                              child: ListStarWidget(movie: movie),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                left: kDefaultPadding,
                                bottom: kDefaultPadding,
                              ),
                              width: size.width,
                              child: const Text('Action & adventure, Comedy'),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                left: kDefaultPadding,
                                bottom: kDefaultPadding,
                              ),
                              width: size.width,
                              child: const Text('1h 41min'),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: kDefaultPadding),
                        child: TabBar(
                          tabs: tab,
                          controller: _tabController,
                          labelColor: AppColors.white,
                          indicatorSize: TabBarIndicatorSize.label,
                          labelStyle: AppStyles.h3,
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const AboutTitle(title: 'Synopsis'),
                                const AboutText(text: textSynopsis),
                                const AboutText(text: textSynopsis2),
                                const AboutTitle(title: 'Cast & Crew'),
                                CasterBar(movie: movie, size: size),
                                const AboutTitle(title: 'Trailer and song'),
                                TrailerBar(movie: movie, size: size),
                              ],
                            ),
                            Container(
                              alignment: Alignment.topCenter,
                              child: const Text('Review Page'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
