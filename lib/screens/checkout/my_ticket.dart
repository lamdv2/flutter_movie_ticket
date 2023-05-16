import 'package:flutter/material.dart';
import 'package:movie_ticket/utils/helper.dart';

import '../../themes/app_colors.dart';
import '../../themes/app_styles.dart';
import '../../utils/constants.dart';

class MyTicket extends StatefulWidget {
  const MyTicket({Key? key}) : super(key: key);

  static const String routeName = '/my_ticket';

  @override
  State<MyTicket> createState() => _MyTicketState();
}

class _MyTicketState extends State<MyTicket> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: size.width / 2,
                child: const Image(
                  image: AssetImage(
                    AssetHelper.imgLogo,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: kDefaultPadding),
                    child: Text(
                      'Happy Watching!',
                      style: AppStyles.h2.copyWith(fontWeight: FontWeight.w500),
                    ),
                  ),
                  Text(
                    'You have successfully',
                    style: AppStyles.h3.copyWith(
                        color: AppColors.grey, fontWeight: FontWeight.w300),
                  ),
                  Text(
                    'bought the ticket!',
                    style: AppStyles.h3.copyWith(
                        color: AppColors.grey, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              Column(
                children: [
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
                      margin: const EdgeInsets.only(bottom: kDefaultPadding),
                      alignment: Alignment.center,
                      child: Text(
                        'My Ticket',
                        style: AppStyles.h3,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Discover new movie? ',
                        style: AppStyles.h4.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        'Back to home',
                        style: AppStyles.h4.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.blueMain,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
