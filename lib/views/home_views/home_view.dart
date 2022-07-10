import 'package:asky/services/auth_services.dart';
import 'package:asky/theme/mytheme.dart';
import 'package:asky/views/home_views/Home.dart';

import 'package:asky/views/profile/student_profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Widget> views = [
    const Home(),
    const StudentProfile(),
    const StudentProfile()
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    //  final text = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
    //     ? 'DarkTheme'
    //     : 'LightTheme';
    return Scaffold(
        appBar: AppBar(),
        drawer: Drawer(
          child: Column(children: [
            TextButton(
                onPressed: () {
                  AuthService().signOut(context);
                },
                child: const Text('Sign out')),
          ]),
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: index,
            onTap: (value) {
              setState(() {
                index = value;
              });
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
              BottomNavigationBarItem(
                label: 'saved',
                icon: Icon(Icons.bookmark),
              ),
              BottomNavigationBarItem(
                label: 'Profile',
                icon: Icon(Icons.person),
              ),
            ]),
        body: views[index]);
  }
}
