import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_ticket/themes/app_colors.dart';
import 'package:movie_ticket/themes/app_styles.dart';

import '../../../common/widgets/stateless/list_star_widget.dart';
import '../../../models/movie.dart';
import '../../../utils/constants.dart';
import '../../movieDetail/movie_detail_page.dart';

class CarouselSliderFirm extends StatefulWidget {
  const CarouselSliderFirm({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  State<CarouselSliderFirm> createState() => _CarouselSliderFirmState();
}

class _CarouselSliderFirmState extends State<CarouselSliderFirm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: CarouselSlider(
        options: CarouselOptions(
          height: widget.size.height / 2.2,
          autoPlay: true,
          initialPage: 0,
          aspectRatio: 16 / 9,
          enlargeCenterPage: true,
          viewportFraction: 0.6,
        ),
        items: movies.map((movie) {
          return Builder(
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(MovieDetailPage.routeName, arguments: movie);
                },
                child: Stack(
                  children: [
                    Container(
                      width: widget.size.width,
                      height: widget.size.height,
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                        color: AppColors.lightBlueNon,
                        borderRadius: kBigBorderRadius,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(movie.background.toString()),
                        ),
                      ),
                    ),
                    Container(
                      height: widget.size.height,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Gradients.darkGreyNon,
                            Gradients.darkGreyMid,
                            Gradients.darkGrey,
                          ],
                        ),
                        borderRadius: kBigBorderRadius,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: widget.size.width,
                            padding: const EdgeInsets.only(
                              left: kTopPadding,
                              bottom: kTopPadding,
                            ),
                            child: Text(
                              movie.name.toString(),
                              style: AppStyles.h1,
                            ),
                          ),
                          Container(
                            width: widget.size.width,
                            padding: const EdgeInsets.only(
                              left: kTopPadding,
                              bottom: kTopPadding,
                            ),
                            margin:
                                const EdgeInsets.only(bottom: kDefaultPadding),
                            child: ListStarWidget(movie: movie),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
