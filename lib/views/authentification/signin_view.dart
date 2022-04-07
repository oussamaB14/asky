import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
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
  Map<String, dynamic>? _userData;
  AccessToken? _accessToken;
  bool _checking = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkIfisLoggedIn();
  }

  _checkIfisLoggedIn() async {
    final accessToken = await FacebookAuth.instance.accessToken;

    setState(() {
      _checking = false;
    });

    if (accessToken != null) {
      print(accessToken.toJson());
      final userData = await FacebookAuth.instance.getUserData();
      _accessToken = accessToken;
      setState(() {
        _userData = userData;
      });
    } else {
      _login();
    }
  }

  _login() async {
    final LoginResult result = await FacebookAuth.instance.login();

    if (result.status == LoginStatus.success) {
      _accessToken = result.accessToken;

      final userData = await FacebookAuth.instance.getUserData();
      _userData = userData;
    } else {
      print(result.status);
      print(result.message);
    }
    setState(() {
      _checking = false;
    });
  }

  _logout() async {
    await FacebookAuth.instance.logOut();
    _accessToken = null;
    _userData = null;
    setState(() {});
  }

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
                      Image.asset('assets/images/LOGO.png', height: 20.h),
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
                          suffixIcon:
                              Icon(CommunityMaterialIcons.email_outline),
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
                      ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35),
                        ))),
                        onPressed: () {
                          AuthService().signInWithEmail(usernameController.text,
                              passwordController.text, context);
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
                      Divider(
                        height: 30,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Color.fromARGB(255, 241, 28, 21)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35),
                            ))),
                        onPressed: () {
                          AuthService().signInwithGoogle().then((value) {
                            if (value != null) {
                              Navigator.pushNamed(context, '/homepage');
                            }
                          });
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
                      SizedBox(height: 2.5.h),
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xFF4285F4)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35),
                            ))),
                        onPressed: () {
                          _userData != null ? _logout : _login;
                          Navigator.pushNamed(context, '/homepage');
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
                      ),
                      Divider(
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
                                Color.fromARGB(255, 58, 63, 70)),
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
