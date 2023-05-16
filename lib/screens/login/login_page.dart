import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_ticket/common/widgets/stateful/custom_dialog.dart';

import '../../common/widgets/stateless/my_button.dart';
import '../../common/widgets/stateless/my_textfield.dart';
import '../../common/widgets/stateless/square_tile.dart';
import '../../services/auth_service.dart';

// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  final Function()? onTap;

  const LoginPage({Key? key, this.onTap}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text editing controller
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  // sign in method
  void signUserIn() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: usernameController.text, password: passwordController.text);
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      inCorrect();
    } on FirebaseAuthException catch (e) {
      //  pop the loading circle
      Navigator.pop(context);
      //  show error message
      wrongMessage(e.code);
    }
  }

  void inCorrect() {
    showDialog(
        context: context,
        anchorPoint: const Offset(10, 10),
        builder: (context) {
          return const CustomDialog(message: 'Login Success');
        });
  }

  // error message show dialog
  void wrongMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return CustomDialog(message: message);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //icon
                const SizedBox(
                  height: 12,
                ),
                const Icon(
                  Icons.ac_unit,
                  size: 100,
                ),

                //welcome
                const SizedBox(
                  height: 48,
                ),
                Text(
                  "Welcome to Travel App DreamTeam",
                  style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),

                //username
                const SizedBox(
                  height: 26,
                ),
                MyTextField(
                  controller: usernameController,
                  hintText: "Enter your email",
                  obscureText: false,
                ),

                //password
                const SizedBox(
                  height: 16,
                ),
                MyTextField(
                  controller: passwordController,
                  hintText: "Enter your password",
                  obscureText: true,
                ),

                //forgot password
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        "Forgot password?",
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ),

                //Btn Sign In
                const SizedBox(
                  height: 45,
                ),
                MyButton(
                  onTap: signUserIn,
                  textBtn: 'Sign In',
                ),

                //divider continue
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey.shade400,
                        ),
                      ),
                      Text(
                        " or continue with ",
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ],
                  ),
                ),

                // google + apple sign in button
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // google
                    SquareTile(
                      onTap: () => AuthService().signInWithGoogle(),
                      imgPath: 'assets/images/google.png',
                    ),

                    //Image(image: AssetImage('lib/images/apple.png'), height: 30,),
                    const SizedBox(
                      width: 24,
                    ),

                    // apple
                    SquareTile(
                      onTap: () {},
                      imgPath: "assets/images/apple.png",
                    ),
                  ],
                ),

                // not a member? register
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(
                        color: Colors.grey.shade700,
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Register',
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
