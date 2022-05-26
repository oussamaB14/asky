import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:sizer/sizer.dart';

// import 'package:flutter_signin_button/flutter_signin_button.dart';

import '../../services/auth_service.dart';
import '../../styles/colors.dart';
import '../Wrapper.dart';

class SigninView extends StatefulWidget {
  const SigninView({Key? key}) : super(key: key);
  @override
  State<SigninView> createState() => SigninViewState();
}

class SigninViewState extends State<SigninView> {
  final _formKry = GlobalKey<FormState>();
  Map<String, dynamic>? _userData;
  AccessToken? _accessToken;
  bool _checking = true;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _obscureText = true;
  var loading = false;
  var loading1 = false;
  var loading2 = false;
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          title: const Text(
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
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: _formKry,
                  child: Column(
                    children: [
                      Image.asset('assets/images/LOGO.png', height: 20.h),
                      SizedBox(
                        height: 3.5.h,
                      ),
                      TextFormField(
                          controller: usernameController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            filled: true,
                            labelText: 'Email',
                            hintText: 'Enter your email',
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 42, vertical: 20),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(28),
                              borderSide: BorderSide(color: MyColors.black),
                              gapPadding: 10,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(28),
                              borderSide: const BorderSide(color: Colors.blue),
                              gapPadding: 10,
                            ),
                            suffixIcon: const Icon(
                                CommunityMaterialIcons.email_outline),
                          ),
                          validator: _requiredValidator),
                      SizedBox(height: 2.5.h),
                      TextFormField(
                        controller: passwordController,
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter your password',
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 42, vertical: 20),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(28),
                            borderSide: BorderSide(color: MyColors.black),
                            gapPadding: 10,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(28),
                            borderSide: const BorderSide(color: Colors.blue),
                            gapPadding: 10,
                          ),
                          // suffixIcon:
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
                        validator: _requiredValidator,
                      ),
                      SizedBox(
                        height: 2.5.h,
                      ),
                      if (loading) ...[
                        const Center(child: CircularProgressIndicator())
                      ],
                      if (!loading) ...[
                        ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35),
                          ))),
                          onPressed: () {
                            if (_formKry.currentState != null &&
                                _formKry.currentState!.validate()) {
                              setState(() {
                                loading = true;
                              });
                              AuthService().signInWithEmail(
                                  usernameController.text,
                                  passwordController.text,
                                  context);
                            }
                          },
                          child: SizedBox(
                            width: double.infinity,
                            height: 6.h,
                            child: Center(
                              child: Text(
                                "Sign in",
                                style: TextStyle(fontSize: 2.5.h),
                              ),
                            ),
                          ),
                        ),
                      ],
                      const Divider(
                        height: 30,
                      ),
                      if (loading1) ...[
                        const Center(
                            child: CircularProgressIndicator(
                          color: Colors.red,
                        ))
                      ],
                      if (!loading1) ...[
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color.fromARGB(255, 241, 28, 21)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(35),
                              ))),
                          onPressed: () {
                            setState(() {
                              loading1 = true;
                            });
                            AuthService().signInwithGoogle(context);
                          },
                          child: SizedBox(
                            width: double.infinity,
                            height: 6.h,
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/icons8-google-48.png',
                                  height: 3.5.h,
                                ),
                                const SizedBox(width: 60),
                                Center(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      "Sign in with Google",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 2.5.h),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                      SizedBox(height: 2.5.h),
                      if (loading2) ...[
                        const Center(
                          child: CircularProgressIndicator(
                            color: Colors.blue,
                          ),
                        )
                      ],
                      if (!loading2) ...[
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color(0xFF4285F4)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(35),
                              ))),
                          onPressed: () {
                            setState(() {
                              loading2 = true;
                            });
                            AuthService().loginWithFacebook(context);
                          },
                          child: SizedBox(
                            width: double.infinity,
                            height: 6.h,
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/icons8-facebook-48.png',
                                  height: 3.5.h,
                                ),
                                const SizedBox(width: 45),
                                Center(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      "Sign in with Facebook",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 2.5.h),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                      const Divider(
                        height: 30,
                      ),
                      Text(
                        "you don't have an account ?",
                        style: TextStyle(fontSize: 1.5.h),
                      ),
                      SizedBox(height: 1.h),
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color.fromARGB(255, 58, 63, 70)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35),
                            ))),
                        onPressed: () {
                          Navigator.of(context).pushNamed("/signup");
                        },
                        child: SizedBox(
                          width: double.infinity,
                          height: 6.h,
                          child: Center(
                            child: Text(
                              "sign up",
                              style: TextStyle(fontSize: 2.5.h),
                            ),
                          ),
                        ),
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

String? _requiredValidator(String? text) {
  if (text == null || text.trim().isEmpty) {
    return 'this filed is required';
  }
  return null;
}
