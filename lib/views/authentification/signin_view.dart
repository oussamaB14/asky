import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// import 'package:flutter_signin_button/flutter_signin_button.dart';

import '../../services/auth_service.dart';
import '../../styles/colors.dart';

class SigninView extends StatefulWidget {
  const SigninView({Key? key}) : super(key: key);
  @override
  State<SigninView> createState() => SigninViewState();
}

class SigninViewState extends State<SigninView> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'Sign in',
            textAlign: TextAlign.center,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text(
                  'Welcome back',
                  textAlign: TextAlign.center,
                  style: textTheme.headline1,
                ),
                Text(
                  'Sign in with your email and password  \nor contuniue with google or Facebook',
                  textAlign: TextAlign.center,
                  style: textTheme.bodyText2,
                ),
                SizedBox(
                  height: 20,
                ),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                          decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter your email',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 42, vertical: 20),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: BorderSide(color: MyColors.yellow),
                          gapPadding: 10,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: BorderSide(color: Colors.blue),
                          gapPadding: 10,
                        ),
                        suffixIcon: Icon(Icons.mail),
                      )),
                      SizedBox(height: 2.5.h),
                      TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            hintText: 'Enter your password',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 42, vertical: 20),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(28),
                              borderSide: BorderSide(color: MyColors.yellow),
                              gapPadding: 10,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(28),
                              borderSide: BorderSide(color: Colors.blue),
                              gapPadding: 10,
                            ),
                            suffixIcon: Icon(Icons.lock),
                          )),
                      SizedBox(
                        height: 2.5.h,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ))),
                        onPressed: () {
                          AuthService().signInWithEmail(usernameController.text,
                              passwordController.text, context);
                        },
                        child: SizedBox(
                          width: double.infinity,
                          height: 6.5.h,
                          child: Center(
                            child: Text(
                              "Sign In",
                              style: TextStyle(fontSize: 3.5.h),
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ))),
                        onPressed: () {
                          AuthService().signInWithEmail(usernameController.text,
                              passwordController.text, context);
                        },
                        child: Container(
                          width: double.infinity,
                          height: 6.5.h,
                          child: Center(
                            child: Text(
                              "Sign In",
                              style: TextStyle(fontSize: 3.5.h),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        height: 30,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
