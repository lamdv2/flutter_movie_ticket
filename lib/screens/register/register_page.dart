import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../common/widgets/stateless/my_button.dart';
import '../../common/widgets/stateless/my_textfield.dart';
import '../../common/widgets/stateless/square_tile.dart';
import '../../services/auth_service.dart';

// ignore: must_be_immutable
class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({Key? key, required this.onTap}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text editing controller
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // sign up method
  void signUserUp() async{
    showDialog(context: context, builder: (context){
      return const Center(
        child: CircularProgressIndicator(),
      );
    });

    try{
      // check if password is confirmed
      if(passwordController.text == confirmPasswordController.text){
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: usernameController.text,
            password: passwordController.text
        );
      }else{
        //  error password don't match

        showErrorMessage("password don't match!");
        // Navigator.pop(context);

      }
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    }
    on FirebaseAuthException catch(e){
      //  pop the loading circle
      Navigator.pop(context);
      //  show error message
      showErrorMessage(e.code);
    }
  }

  void incorrect(){
    showDialog(
        context: context,
        anchorPoint: const Offset(10, 10),
        builder: (context){
          return const AlertDialog(
            title: Text('Login Success'),
          );
        });
  }

  // error message show dialog
  void showErrorMessage(String message){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        backgroundColor: Colors.blue,
        title: Text(
          message,
          style: const TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      );
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
                const SizedBox(height: 12,),
                const Icon(
                  Icons.ac_unit,
                  size: 100,
                ),

                //welcome
                const SizedBox(height: 38,),
                Text("Let's create an account for you!",
                  style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                  ),
                ),

                //username
                const SizedBox(height: 26,),
                MyTextField(
                  controller: usernameController,
                  hintText: "Enter your email",
                  obscureText: false,
                ),

                //password
                const SizedBox(height: 16,),
                MyTextField(
                  controller: passwordController,
                  hintText: "Enter your password",
                  obscureText: true,
                ),

                //confirm password
                const SizedBox(height: 16,),
                MyTextField(
                  controller: confirmPasswordController,
                  hintText: "Confirm your password",
                  obscureText: true,
                ),

                //Btn Sign In
                const SizedBox(height: 45,),
                MyButton(
                  onTap: signUserUp,
                  textBtn: 'Sign Up',
                ),

                //divider continue
                const SizedBox(height: 30,),
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
                      Text(" or continue with ",
                        style: TextStyle(
                            color: Colors.grey.shade700
                        ),
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

                // google + apple signin button
                const SizedBox(height: 16,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // google
                    SquareTile(
                      onTap: () => AuthService().signInWithGoogle(),
                      imgPath: 'assets/images/google.png',
                    ),

                    //Image(image: AssetImage('lib/images/apple.png'), height: 30,),
                    const SizedBox(width: 24,),

                    // apple
                    SquareTile(
                      onTap: () {},
                      imgPath: "assets/images/apple.png",
                    ),
                  ],
                ),

                // not a member? register
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have a account ?', style: TextStyle(
                      color: Colors.grey.shade700,
                    ),),
                    const SizedBox(width: 4,),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text('Login now', style: TextStyle(
                          color: Colors.blueAccent,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold
                      ),),
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
