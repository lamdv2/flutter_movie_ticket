import 'package:flutter/material.dart';
import 'package:movie_ticket/common/widgets/stateless/list_star_widget.dart';
import 'package:movie_ticket/common/widgets/stateless/my_button.dart';
import 'package:movie_ticket/models/movie.dart';
import 'package:movie_ticket/screens/checkout/my_ticket.dart';
import 'package:movie_ticket/screens/checkout/widgets/build_price_tag.dart';
import 'package:movie_ticket/screens/selectCinema/widget/custom_header.dart';
import 'package:movie_ticket/themes/app_colors.dart';
import 'package:movie_ticket/themes/app_styles.dart';
import 'package:movie_ticket/utils/constants.dart';
import 'package:movie_ticket/utils/helper.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({Key? key}) : super(key: key);

  static const routeName = '/check_out';

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomHeader(size: size, content: 'Checkout\nMovie'),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: AppColors.white, width: 1)),
              ),
              margin: const EdgeInsets.symmetric(
                  horizontal: kMediumPadding, vertical: kMediumPadding),
              padding: const EdgeInsets.only(bottom: kTop32Padding),
              child: Row(
                children: [
                  SizedBox(
                    width: size.width / 4.3,
                    child: const Image(
                      image: AssetImage(AssetHelper.imgRalph),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: kMediumPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: kMinPadding),
                            child: Text(
                              movie.name.toString(),
                              style: AppStyles.h3,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: kMinPadding),
                            child: ListStarWidget(movie: movie),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: kMinPadding),
                            child: Text(
                              'Action & adventure, Comedy',
                              style:
                                  AppStyles.h4.copyWith(color: AppColors.grey),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: kMinPadding),
                            child: Text(
                              '1h 41min',
                              style:
                                  AppStyles.h4.copyWith(color: AppColors.grey),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const BuildPriceTag(content: 'ID Order', price: '22081996'),
            const BuildPriceTag(content: 'Cinema', price: 'FX Sudirman XXI'),
            const BuildPriceTag(
                content: 'Date & Time', price: 'Sun May 22,  16:40'),
            const BuildPriceTag(content: 'Seat Number', price: 'D7,D8,D9'),
            const BuildPriceTag(content: 'Price', price: 'Rp 50.000 x 3'),
            Container(
              padding: const EdgeInsets.only(
                top: kItemPadding,
                bottom: kTop32Padding,
              ),
              margin: const EdgeInsets.symmetric(horizontal: kMediumPadding),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: AppColors.white, width: 1),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: AppStyles.h4.copyWith(color: AppColors.grey),
                  ),
                  Text(
                    'Rp 150.000',
                    style: AppStyles.h4.copyWith(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                top: kMediumPadding,
                bottom: kTop32Padding,
              ),
              margin: const EdgeInsets.symmetric(horizontal: kMediumPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Your Wallet',
                    style: AppStyles.h4.copyWith(color: AppColors.grey),
                  ),
                  Text(
                    'IDR 200.000',
                    style: AppStyles.h4.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.blueMain,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(MyTicket.routeName);
              },
              child: Container(
                height: 60,
                width: size.width / 1.5,
                decoration: const BoxDecoration(
                  color: AppColors.blueMain,
                  borderRadius: kDefaultBorderRadius,
                ),
                alignment: Alignment.center,
                child: Text(
                  'Checkout',
                  style: AppStyles.h3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
