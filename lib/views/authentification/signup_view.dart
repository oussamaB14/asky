import 'package:asky/views/Wrapper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

// import '../../services/auth_service.dart';
import '../../services/auth_service.dart';
import '../../styles/colors.dart';

class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);
  @override
  State<SignupView> createState() => SignupViewState();
}

class SignupViewState extends State<SignupView> {
  User? user;
  List selected = [];
  bool isTeacher = false;
  bool isVisible = false;
  bool isCircleVisible = true;
  String imageUrl = '';
  final _formKry = GlobalKey<FormState>();
  // final _secondKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  // TextEditingController _educationFiled = TextEditingController();
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
                            controller: nameController,
                            decoration: InputDecoration(
                              filled: true,
                              labelText: 'full name',
                              hintText: 'Enter your name',
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
                                borderSide:
                                    const BorderSide(color: Colors.blue),
                                gapPadding: 10,
                              ),
                              suffixIcon:
                                  const Icon(CommunityMaterialIcons.account),
                            ),
                            validator: _requiredValidator),
                        SizedBox(
                          height: 3.5.h,
                        ),
                        TextFormField(
                            controller: emailController,
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
                                borderSide:
                                    const BorderSide(color: Colors.blue),
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
                                borderSide:
                                    const BorderSide(color: Colors.blue),
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
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 42, vertical: 20),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(28),
                                borderSide: BorderSide(color: MyColors.black),
                                gapPadding: 10,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(28),
                                borderSide:
                                    const BorderSide(color: Colors.blue),
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
                                    emailController.text,
                                    passwordController.text,
                                    context);
                                setState(() {
                                  loading = true;
                                });
                              }
                              // _signUp();
                            },
                            child: SizedBox(
                              width: double.infinity,
                              height: 6.h,
                              child: Center(
                                child: Text(
                                  "Sign up",
                                  style: TextStyle(fontSize: 3.h),
                                ),
                              ),
                            ),
                          )
                        ],
                        const Divider(
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
                                  const Color.fromARGB(255, 58, 63, 70)),
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

  // Future signUpWithEmail(String email, String password, String username,
  //     String role, String educationfiled) async {
  //   try {
  //     var res = await FirebaseAuth.instance
  //         .createUserWithEmailAndPassword(email: email, password: password);
  //     await FirebaseFirestore.instance.collection('user').add({
  //       'email': email,
  //       'name': nameController.text,
  //       'id': user?.uid,
  //       // 'photoURL': user?.photoURL ?? '',
  //       // 'bio': bioController.text,
  //       // 'educationFiled': educationfiled.,
  //       // 'role': role,
  //     });

  //     await showDialog(
  //         context: context,
  //         builder: (context) => AlertDialog(
  //               title: const Text('Sign up Succeeded'),
  //               content: const Text(
  //                   'Now add your informations complete your account !'),
  //               actions: [
  //                 TextButton(
  //                     onPressed: () {
  //                       Navigator.of(context).pushReplacementNamed('test');
  //                     },
  //                     child: const Text('ok'))
  //               ],
  //             ));
  //     Navigator.of(context).pushReplacementNamed('test');
  //   } on FirebaseAuthException catch (e) {
  //     _handleSignUpError(e);
  //   }
  //   // ScaffoldMessenger.of(context)
  //   //     .showSnackBar(SnackBar(content: Text(e.message.toString())));
  // }

  // void _handleSignUpError(FirebaseAuthException e) {
  //   String messageToDisplay;
  //   switch (e.code) {
  //     case 'email-already-in-use':
  //       messageToDisplay = 'This email is already in use';
  //       break;
  //     case 'invalid-email':
  //       messageToDisplay = 'This email is invalid';
  //       break;
  //     case 'Operation-not-allowed':
  //       messageToDisplay = 'this operation is not allowed';
  //       break;
  //     case 'weak-password':
  //       messageToDisplay =
  //           'This password is too weak! , try with another password.';
  //       break;
  //     default:
  //       messageToDisplay = 'An unknown error occurred';
  //       break;
  //   }
  //   // showDialog(
  //   //     context: context,
  //   //     builder: (BuildContext context) => AlertDialog(
  //   //           title: Text('Sign up Failed'),
  //   //           content: Text(messageToDisplay),
  //   //           actions: [
  //   //             TextButton(
  //   //                 onPressed: () {
  //   //                   Navigator.of(context).pop();
  //   //                 },
  //   //                 child: Text('Ok'))
  //   //           ],
  //   //         ));
  //   // }
  // }

  // Future _signUp() async {
  //   setState(() {
  //     loading = true;
  //   });
  //   try {
  //     await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //         email: emailController.text, password: passwordController.text);
  //     await FirebaseFirestore.instance.collection('user').add({
  //       'email': emailController.text,
  //       'name': nameController.text,
  //       'id': user?.uid,
  //       'photoURL': user?.photoURL ?? '',
  //       'bio': bioController,
  //       'educationFiled': educationfiled,
  //       'role': role,
  //     });
  //     await showDialog(
  //         context: context,
  //         builder: (context) => AlertDialog(
  //               title: const Text('Sign up Succeeded'),
  //               content:
  //                   const Text('your account was created , you can log in now'),
  //               actions: [
  //                 TextButton(
  //                     onPressed: () {
  //                       Navigator.of(context).pop();
  //                     },
  //                     child: const Text('ok'))
  //               ],
  //             ));
  //     Navigator.of(context).pop();
  //   } on FirebaseAuthException catch (e) {
  //     _handleSignUpError(e);
  //   }
  // }

}

String? _requiredValidator(String? text) {
  if (text == null || text.trim().isEmpty) {
    return 'this filed is required';
  }
  return null;
}
