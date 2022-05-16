import 'package:asky/models/tags.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AddTag extends StatefulWidget {
  const AddTag({Key? key}) : super(key: key);

  @override
  State<AddTag> createState() => _AddTagState();
}

class _AddTagState extends State<AddTag> {
  List<TagModel> questionTags = [];
  List tags = [
    'Java',
    'Php',
    'C++',
    'Technology',
    'HTML',
    'Algorithm',
    'React',
    'Dart',
    'C#',
    '3D',
    'AI',
    'IOT',
    'python',
    'framework',
    'backend',
    'frontend',
    'javaScript',
    'Angular',
    'Web',
    'mobile',
    'Mathematics',
    'Physics',
    'IT',
    'Machine Learning',
    'Internet security'
  ];

  int _value = 1;

  List selected = [];

  @override
  Widget build(BuildContext context) {
    final isDarkTheme =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Column(
      children: [
        const Text('add a tag '),
        SingleChildScrollView(
          // scrollDirection: Axis.horizontal,
          child: Wrap(
            children: List<Widget>.generate(
              tags.length,
              (int idx) {
                return Container(
                  height: 5.h,
                  margin: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 10),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: RawChip(
                      backgroundColor: Colors.grey.shade100,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(45),
                      ),
                      label: Text(tags[idx]),
                      labelStyle: TextStyle(
                        color: isDarkTheme
                            ? _value == idx
                                ? Colors.white
                                : Colors.black
                            : _value == idx
                                ? Colors.white
                                : Colors.black,
                      ),
                      selected: _value == idx,
                      showCheckmark: false,
                      onSelected: (bool selected) {
                        setState(() {
                          _value = (selected ? idx : null)!;
                        });
                      }),
                );
              },
            ).toList(),
          ),
        ),
        // SizedBox(
        //   height: 50,
        //   child: ListView.builder(
        //     // physics: NeverScrollableScrollPhysics(),
        //     shrinkWrap: true,
        //     scrollDirection: Axis.horizontal,
        //     itemCount: tags.length,
        //     itemBuilder: (context, idx) {
        //       return RawChip(
        //           selectedColor: Colors.blue,
        //           backgroundColor: const Color(0xFFE1E4F3),
        //           shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(45),
        //           ),
        //           // checkmarkColor: Colors.white,
        //           label: Text(tags[idx]),
        //           selected: _value == idx,
        //           onSelected: (bool selected) {
        //             setState(() {
        //               _value = (selected ? idx : null)!;
        //             });
        //           });
        //     },
        //   ),
        // ),
        // SizedBox(
        //   height: 50,
        //   child: ListView.builder(
        //     // physics: NeverScrollableScrollPhysics(),
        //     shrinkWrap: true,
        //     scrollDirection: Axis.horizontal,
        //     itemCount: tags.length,
        //     itemBuilder: (context, idx) {
        //       return RawChip(
        //           selectedColor: Colors.blue,
        //           backgroundColor: const Color(0xFFE1E4F3),
        //           shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(45),
        //           ),
        //           // checkmarkColor: Colors.white,
        //           label: Text(tags[idx]),
        //           selected: _value == idx,
        //           onSelected: (bool selected) {
        //             setState(() {
        //               _value = (selected ? idx : null)!;
        //             });
        //           });
        //     },
        //   ),
        // ),
      ],
    );
  }
}
