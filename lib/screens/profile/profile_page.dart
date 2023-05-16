import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_ticket/screens/login/auth_page.dart';
import 'package:movie_ticket/screens/login/login_page.dart';
import 'package:movie_ticket/themes/app_colors.dart';
import 'package:movie_ticket/themes/app_styles.dart';
import 'package:movie_ticket/utils/constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  static const String routeName = '/profile_screen';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

void signUserOut() {
  FirebaseAuth.instance.signOut();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final userName = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              signUserOut();
              Navigator.pushNamed(context, AuthPage.routeName);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
        backgroundColor: AppColors.darkBackground,
        centerTitle: true,
        title: Text(
          'Your Profile',
          style: AppStyles.h2,
        ),
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text(userName != null ? 'Hi ${userName.toString()}!' : 'Hi User!',
                  style: AppStyles.h3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
