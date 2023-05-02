import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_ticket/common/widgets/stateless/star_half_widget.dart';
import 'package:movie_ticket/screens/home/widgets/title.dart';
import 'package:movie_ticket/themes/app_colors.dart';
import 'package:movie_ticket/themes/app_styles.dart';

import '../../../common/widgets/stateless/star_widget.dart';
import '../../../models/movie.dart';
import '../../../utils/constants.dart';

class CarouselSliderFirm extends StatefulWidget {
  const CarouselSliderFirm({
    super.key,
    required this.movies,
    required this.size,
  });

  final Size size;
  final List<Movie> movies;

  @override
  State<CarouselSliderFirm> createState() => _CarouselSliderFirmState();
}

class _CarouselSliderFirmState extends State<CarouselSliderFirm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: Column(
        children: [
          const TitleHome(title: 'Now Playing'),
          CarouselSlider(
            options: CarouselOptions(
              height: widget.size.height / 2.2,
              autoPlay: true,
              initialPage: 0,
              aspectRatio: 16 / 9,
              enlargeCenterPage: true,
              viewportFraction: 0.6,
            ),
            items: widget.movies.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Stack(
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
                            image: AssetImage(i.background.toString()),
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
                                i.name.toString(),
                                style: AppStyles.h1,
                              ),
                            ),
                            Container(
                              width: widget.size.width,
                              padding: const EdgeInsets.only(
                                left: kTopPadding,
                                bottom: kTopPadding,
                              ),
                              margin: const EdgeInsets.only(bottom: kDefaultPadding),
                              child: Row(
                                children: [
                                  if (i.star != null && i.star! >= 4)
                                    ...List.generate(4, (index) =>  const StarWidget()),
                                  if (i.star != null && i.star! > 4 && i.star! < 5)
                                    const StarHalfWidget(),
                                  if (i.star != null && i.star! == 5)
                                    ...List.generate(5, (index) => const StarWidget()),
                                  if (i.star != null && i.star! < 4)
                                    ...List.generate(3, (index) => const StarWidget()),
                                  if (i.star != null && i.star! > 3 && i.star! < 4)
                                    const StarHalfWidget(),
                                  Text(' (${i.star.toString()})', style: AppStyles.h5,),
                                ],
                              ),

                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}


