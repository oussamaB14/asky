import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:sizer/sizer.dart';

import '../../services/auth_service.dart';
import '../../styles/colors.dart';

class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);
  @override
  State<SignupView> createState() => SignupViewState();
}

class SignupViewState extends State<SignupView> {
  String imageUrl = '';
  final _formKry = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  var loading = false;
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
                    'Welcome to Asky',
                    textAlign: TextAlign.center,
                    style: textTheme.headline1,
                  ),
                  Text(
                    'Sign up with your email and password  \nor contuniue with google or Facebook',
                    textAlign: TextAlign.center,
                    style: textTheme.bodyText2,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Userimage(onFilechanged: (imageUrl) {
                  //   setState(() {
                  //     this.imageUrl = imageUrl;
                  //   });
                  // }),
                  Form(
                    key: _formKry,
                    child: Column(
                      children: [
                        Image.asset('assets/images/LOGO.png', height: 20.h),
                        SizedBox(
                          height: 3.5.h,
                        ),
                        TextFormField(
                            controller: username,
                            decoration: InputDecoration(
                              filled: true,
                              labelText: 'full name',
                              hintText: 'Enter your name',
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 42, vertical: 20),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(28),
                                borderSide: BorderSide(color: MyColors.black),
                                gapPadding: 10,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(28),
                                borderSide: BorderSide(color: Colors.blue),
                                gapPadding: 10,
                              ),
                              suffixIcon: Icon(CommunityMaterialIcons.account),
                            ),
                            validator: _requiredValidator),
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
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 42, vertical: 20),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(28),
                                borderSide: BorderSide(color: MyColors.black),
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
                            validator: _requiredValidator),
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
                                borderSide: BorderSide(color: MyColors.black),
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
                            validator: _requiredValidator),
                        SizedBox(
                          height: 2.5.h,
                        ),
                        TextFormField(
                            controller: confirmPasswordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              hintText: 'confirme your password',
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 42, vertical: 20),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(28),
                                borderSide: BorderSide(color: MyColors.black),
                                gapPadding: 10,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(28),
                                borderSide: BorderSide(color: Colors.blue),
                                gapPadding: 10,
                              ),
                              filled: true,
                            ),
                            validator: (String? passwordText) {
                              if (passwordText == null ||
                                  passwordText.trim().isEmpty) {
                                return 'this filed is required';
                              }
                              if (passwordController.text != passwordText) {
                                return "Password don't match";
                              }

                              return null;
                            }),
                        SizedBox(
                          height: 3.5.h,
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
                                AuthService().signUpWithEmail(
                                    usernameController.text,
                                    passwordController.text,
                                    context);
                                setState(() {
                                  loading = true;
                                });
                              }
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
                          )
                        ],
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

//   Future _signUp() async {
//     setState(() {
//       loading = true;
//     });
//     try{
//       await FirebaseAuth.instance.createUserWithEmailAndPassword(email: usernameController.text, password: passwordController.text);
//       await FirebaseFirestore.instance.collection('user').add({
//         'email': usernameController.text,
//         'name': username.text,
//       });
//       await showDialog(
//           context: context,
//           builder: (context) => AlertDialog(
//                 title: Text('Sign up Succeeded'),
//                 content: Text('your account was created , you can log in now'),
//                 actions: [
//                   TextButton(
//                       onPressed: () {
//                         Navigator.of(context).pop();
//                       },
//                       child: Text('ok'))
//                 ],
//               ));
//               Navigator.of(context).pop();
//     }
//   }
// }

String? _requiredValidator(String? text) {
  if (text == null || text.trim().isEmpty) {
    return 'this filed is required';
  }
  return null;
}

// String? _confirmPassworddValidator(String? passwordText) {
//   if (passwordText == null || passwordText.trim().isEmpty) {
//     return 'this filed is required';
//   }
//   if (passwordController.text != passwordText) {
//     return "Password don't match";
//   }

//   return null;
// }
