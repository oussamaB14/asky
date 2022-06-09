import 'package:asky/services/auth_service.dart';
import 'package:asky/views/Admin/shared/DashboardColors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({
    Key? key,
  }) : super(key: key);

  @override
  _AdminLoginState createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  bool isChecked = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AdminColors.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Text(
            //   'Admin Login ',
            //   style: TextStyle(color: AdminColors.white, fontSize: 11.sp),
            // ),

            Image.asset('assets/images/LOGO.png', height: 20.h),

            SizedBox(height: 5.h),
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: SizedBox(
                width: 100.h,
                height: 60.h,
                child: Card(
                  color: AdminColors.black,
                  child: Form(
                      child: Column(
                    children: [
                      Text('Asky Dashboard',
                          style: TextStyle(
                              color: AdminColors.white, fontSize: 11.sp)),
                      SizedBox(height: 10.h),
                      SizedBox(
                        width: 80.h,
                        height: 8.h,
                        child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            decoration: InputDecoration(
                              labelText: 'Email ',
                              labelStyle: TextStyle(color: AdminColors.white),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(color: AdminColors.white),
                                gapPadding: 10,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(color: AdminColors.purple),
                                gapPadding: 10,
                              ),
                            ),
                            style: TextStyle(
                                fontSize: 7.sp, color: AdminColors.white)),
                      ),
                      SizedBox(height: 5.h),
                      SizedBox(
                          width: 80.h,
                          height: 8.h,
                          child: TextFormField(
                            obscureText: true,
                            controller: passwordController,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: TextStyle(color: AdminColors.white),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(color: AdminColors.white),
                                gapPadding: 10,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(color: AdminColors.purple),
                                gapPadding: 10,
                              ),
                            ),
                            style: TextStyle(
                                fontSize: 7.sp, color: AdminColors.white),
                          )),
                      SizedBox(height: 5.h),
                      SizedBox(
                          width: 30.h,
                          height: 6.h,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      AdminColors.purple)),
                              onPressed: () {
                                FirebaseFirestore.instance
                                    .collection('user')
                                    .get()
                                    .then((value) {
                                  value.docs.forEach((element) {
                                    if (element['email'] ==
                                        emailController.text) {
                                      if (element['isAdmin']) {
                                        AuthService().signInWithEmail(
                                            emailController.text,
                                            passwordController.text,
                                            context);
                                      }
                                      return;
                                    }
                                  });
                                });
                              },
                              child: Text(
                                'Login',
                                style: GoogleFonts.overpass(
                                    textStyle:
                                        Theme.of(context).textTheme.headline2,
                                    fontSize: 6.sp,
                                    color: AdminColors.white),
                              ),
                            ),
                          ))
                    ],
                  )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
