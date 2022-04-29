import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AnwserButton extends StatefulWidget {
  const AnwserButton({Key? key}) : super(key: key);

  @override
  State<AnwserButton> createState() => _AnwserButtonState();
}

class _AnwserButtonState extends State<AnwserButton> {
  TextEditingController _anwserController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet<void>(
            builder: (BuildContext context) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                height: 40.h,
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
                      Spacer(),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: TextButton(
                            onPressed: () {},
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
      child: Icon(CommunityMaterialIcons.card_text_outline),
    );
  }
}
