import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_ticket/screens/home/widgets/title.dart';
import 'package:movie_ticket/themes/app_colors.dart';
import 'package:movie_ticket/themes/app_styles.dart';
import 'package:movie_ticket/utils/helper.dart';

import '../../../models/movie.dart';
import '../../../utils/constants.dart';

class CarouselSliderFirm extends StatefulWidget {
  const CarouselSliderFirm({
    super.key,
    required this.genres,
    required this.size,
  });

  final Size size;
  final List<Movie> genres;

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
            items: listMovies.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: widget.size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: AppColors.lightBlueNon,
                      borderRadius: kBigBorderRadius,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(i.background.toString()),
                      ),
                    ),

                    child: Text(
                      '${i.getType()}',
                      style: const TextStyle(fontSize: 32.00),
                    ),
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
