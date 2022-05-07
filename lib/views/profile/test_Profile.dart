import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  List<bool> isSelected = [true, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          child: Container(
        color: Theme.of(context).cardColor,
        // elevation: 1,
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Wrap(
            children: [
              Row(
                children: [
                  SizedBox(width: 1.5.h),
                  CircleAvatar(
                    radius: 4.h,
                  ),
                  SizedBox(width: 1.h),
                  SizedBox(
                    width: 2.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text('data'),
                      Text(
                        'data',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              // Divider(),
              // SizedBox(height: 2.h),
              Wrap(children: [
                Row(
                  children: [
                    SizedBox(
                      width: 5.h,
                    ),
                    Text(
                      "10",
                      style: TextStyle(
                        fontSize: 2.5.h,
                      ),
                    ),
                    SizedBox(
                      width: 1.h,
                    ),
                    Text(
                      "Questions",
                      style: GoogleFonts.lato(
                        textStyle: Theme.of(context).textTheme.headline6,
                        fontSize: 2.5.h,
                      ),
                    ),
                    SizedBox(
                      width: 6.h,
                    ),
                    Text(
                      "10",
                      style: TextStyle(
                        fontSize: 2.5.h,
                      ),
                    ),
                    SizedBox(
                      width: 1.h,
                    ),
                    Text("Anwsers",
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.headline6,
                          fontSize: 2.5.h,
                        )),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 1.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 2.h,
                        ),
                        const Text(
                          'educationFiled',
                          style: TextStyle(color: Colors.blue),
                        ),
                        const Text('bio'),
                        SizedBox(
                          height: 15.h,
                        ),
                      ],
                    ),
                  ],
                )
              ]),
              Center(
                child: Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(27)),
                  child: ToggleButtons(
                      selectedColor: Colors.blue,
                      disabledColor: Colors.grey,
                      color: Colors.grey,
                      fillColor: Colors.transparent,
                      selectedBorderColor: Colors.lightBlue,
                      borderRadius: BorderRadius.circular(40),
                      borderWidth: 0.2.h,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 45),
                          child: Text(
                            'Questions',
                            style: TextStyle(fontSize: 3.h),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 45),
                          child:
                              Text('Anwsers', style: TextStyle(fontSize: 3.h)),
                        )
                      ],
                      isSelected: isSelected,
                      onPressed: (int newIdx) {
                        setState(() {
                          for (int idx = 0; idx < isSelected.length; idx++) {
                            if (idx == newIdx) {
                              isSelected[idx] = true;
                            } else {
                              isSelected[idx] = false;
                            }
                          }
                        });
                      }),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
