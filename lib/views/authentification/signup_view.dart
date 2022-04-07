import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../services/auth_service.dart';
import '../../styles/colors.dart';

class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);
  @override
  State<SignupView> createState() => SignupViewState();
}

class SignupViewState extends State<SignupView> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Sign up',
          style: textTheme.headline3,
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    'Sign in with your email and password  \nor contuniue with google or Facebook',
                    textAlign: TextAlign.center,
                    style: textTheme.bodyText2,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Form(
                    child: Column(
                      children: [
                        Image.asset('assets/images/LOGO.png', height: 20.h),
                        SizedBox(
                          height: 3.5.h,
                        ),
                        TextFormField(
                          controller: usernameController,
                          decoration: InputDecoration(
                            filled: true,
                            labelText: 'full name',
                            hintText: 'Enter your name',
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
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
                            suffixIcon: Icon(CommunityMaterialIcons.account),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 3.5.h,
                        ),
                        TextFormField(
                          controller: usernameController,
                          decoration: InputDecoration(
                            filled: true,
                            labelText: 'Email',
                            hintText: 'Enter your email',
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
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
                            suffixIcon: Icon(CommunityMaterialIcons.email_outline),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 2.5.h),
                        TextFormField(
                          controller: passwordController,
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            hintText: 'Enter your password',
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
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
                            filled: true,
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                              child: Icon(_obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Password';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 2.5.h,
                        ),
                        TextFormField(
                          controller: passwordController,
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            hintText: 'confirme your password',
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
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
                            filled: true,
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                              child: Icon(_obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Password';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 3.5.h,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35),
                          ))),
                          onPressed: () {
                            AuthService().signUpWithEmail(
                                usernameController.text,
                                passwordController.text,
                                context);
                          },
                          child: SizedBox(
                            width: double.infinity,
                            height: 6.h,
                            child: Center(
                              child: Text(
                                "Sign Up",
                                style: TextStyle(fontSize: 3.h),
                              ),
                            ),
                          ),
                        ),
                        // ElevatedButton(
                        //   style: ButtonStyle(
                        //       shape: MaterialStateProperty.all<
                        //           RoundedRectangleBorder>(RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.circular(20),
                        //   ))),
                        //   onPressed: () {
                        //     AuthService().signInWithEmail(usernameController.text,
                        //         passwordController.text, context);
                        //   },
                        //   child: Container(
                        //     width: double.infinity,
                        //     height: 6.5.h,
                        //     child: Center(
                        //       child: Text(
                        //         "Sign In",
                        //         style: TextStyle(fontSize: 3.5.h),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        Divider(
                          height: 30,
                        ),
                        Text(
                          "Already have an account ?",
                          style: TextStyle(fontSize: 1.5.h),
                        ),
                        SizedBox(height: 1.h),
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Color.fromARGB(255, 58, 63, 70)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(35),
                              ))),
                          onPressed: () {
                            Navigator.of(context).pushNamed("/signin");
                          },
                          child: SizedBox(
                            width: double.infinity,
                            height: 6.h,
                            child: Center(
                              child: Text(
                                "sign in",
                                style: TextStyle(fontSize: 3.h),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ))),
    );
  }
}
