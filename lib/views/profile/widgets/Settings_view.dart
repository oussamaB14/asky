import 'package:flutter/material.dart';

import '../../../styles/theme.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // late List languages = ['English', 'French'];
  bool isChecked = false;
  int _value = 0;
  bool toggeled = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Settings"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(
            Icons.save,
            color: Colors.white,
          ),
        ),
        body: Card(
          child: Column(children: [
            // ExpansionTile(
            //   title: const Text(
            //     'Language',
            //     style: TextStyle(fontSize: 16),
            //   ),
            //   leading: const Icon(Icons.language),
            //   children: [
            //     Wrap(
            //       children: List<Widget>.generate(
            //         languages.length,
            //         (int idx) {
            //           return Wrap(children: <Widget>[
            //             Container(
            //               margin: const EdgeInsets.symmetric(
            //                   horizontal: 10, vertical: 10),
            //               padding: const EdgeInsets.symmetric(
            //                   vertical: 15, horizontal: 5),
            //               child: CheckboxListTile(
            //                 title: Text(languages[idx]),
            //                 value: _value == idx,
            //                 onChanged: (bool? value) {
            //                   setState(() {
            //                     isChecked = (value!);
            //                     _value = (value ? idx : null)!;
            //                   });
            //                 },
            //               ),
            //             ),
            //           ]);
            //         },
            //       ).toList(),
            //     ),
            //   ],
            // ),
            SwitchListTile(
                title: const Text(
                  'Dark mood',
                  style: TextStyle(fontSize: 16),
                ),
                secondary: const Icon(Icons.dark_mode),
                value: toggeled,
                onChanged: (bool toggelValue) {
                  setState(() {
                    toggeled = toggelValue;
                  });
                  ThemeProvider().toggleTheme(toggeled);
                })
          ]),
        ));
  }
}
