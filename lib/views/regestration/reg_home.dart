import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegHomeView extends StatefulWidget {
  const RegHomeView({Key? key}) : super(key: key);

  @override
  State<RegHomeView> createState() => _RegHomeViewState();
}

class _RegHomeViewState extends State<RegHomeView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      child: Row(children: const [
                        Text("Contunie as"),
                      ]),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("teacher");
                    },
                    child: const Text(
                      "Teacher",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("student");
                    },
                    child: const Text(
                      "Student",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
