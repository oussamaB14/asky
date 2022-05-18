import 'package:asky/constants/assets.dart';
import 'package:asky/services/user_service.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../services/AnwserService.dart';
import '../../../styles/colors.dart';

class AnswerButton extends StatelessWidget {
  final String id;
  AnswerButton({Key? key, required this.id}) : super(key: key);

  TextEditingController _anwserController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final isDarkTheme =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return GestureDetector(
      onTap: () {
        showModalBottomSheet<void>(
            builder: (BuildContext context) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                height: 50.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(4.h),
                  ),
                ),
                child: Column(
                  children: [
                    Row(children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: const Icon(Icons.close)),
                      const Spacer(),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: TextButton(
                            onPressed: () async {
                              String x =
                                  await UserService().getUserProfileUrl();
                              //String y = await UserService().getUserName();
                              AnwserService().addAnswer({
                                'username': FirebaseAuth
                                        .instance.currentUser?.displayName ??
                                    '',
                                'imgUrl': x,
                                'answer': _anwserController.text
                              }, id);
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'Anwser',
                              style: TextStyle(fontSize: 1.5.h),
                            )),
                      )
                    ]),
                    // const Divider(
                    //   thickness: 2,
                    // ),
                    SizedBox(
                      height: 3.h,
                    ),
                    TextFormField(
                      controller: _anwserController,
                      decoration: const InputDecoration(
                          label: Text('Anwser'),
                          hintText: 'Write your anwser here'),
                    ),
                  ],
                ),
              );
            },
            context: context);
      },
      child: Icon(
        CommunityMaterialIcons.card_text_outline,
        color: isDarkTheme ? MyColors.green : appColor,
      ),
    );
  }
}
