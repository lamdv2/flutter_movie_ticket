import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raised_buttons/raised_buttons.dart';
import '../../main.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String dataFromFourth = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Login"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.blue,
                  onSurface: Colors.red,
                ),
                onPressed: ()=> Get.off(const MyApp()),
                child: const Text("Login")),

          ],
        ),
      ),
    );
  }
}

