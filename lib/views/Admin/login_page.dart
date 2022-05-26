import 'package:asky/views/Admin/shared/DashboardColors.dart';
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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AdminColors.backgroundColor,
      body: Container(
        height: (MediaQuery.of(context).size.height),
        width: (MediaQuery.of(context).size.width),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Text(
              //   'Admin Login ',
              //   style: TextStyle(color: AdminColors.white, fontSize: 11.sp),
              // ),

              Image.asset('assets/images/LOGO.png', height: 20.h),
              SizedBox(height: 5.h),
              Form(
                  child: Column(
                children: [
                  SizedBox(
                    width: 80.h,
                    height: 8.h,
                    child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email ',
                          labelStyle: TextStyle(color: AdminColors.white),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: AdminColors.white),
                            gapPadding: 10,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: AdminColors.purple),
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
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(color: AdminColors.white),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: AdminColors.white),
                            gapPadding: 10,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: AdminColors.purple),
                            gapPadding: 10,
                          ),
                        ),
                        style:
                            TextStyle(fontSize: 7.sp, color: AdminColors.white),
                      )),
                  SizedBox(height: 5.h),
                  SizedBox(
                      width: 40.h,
                      height: 8.h,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  AdminColors.purple)),
                          onPressed: () {},
                          child: Text(
                            'Login',
                            style: GoogleFonts.overpass(
                                textStyle:
                                    Theme.of(context).textTheme.headline2,
                                fontSize: 8.sp,
                                color: AdminColors.white),
                          ),
                        ),
                      ))
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
