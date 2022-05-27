import 'package:asky/views/Admin/shared/DashboardColors.dart';
import 'package:asky/views/AnwserView/widgets/Edit_anwser.dart';
import 'package:asky/views/QuestionViews/EditQuestion.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Dashboardpopup extends StatefulWidget {
  const Dashboardpopup({Key? key}) : super(key: key);

  @override
  State<Dashboardpopup> createState() => _DashboardpopupState();
}

class _DashboardpopupState extends State<Dashboardpopup> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        icon: Icon(
          Icons.account_circle,
          color: AdminColors.white,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25.0),
          ),
        ),
        onSelected: (int item) => onSelected(context, item),
        itemBuilder: (context) => [
              PopupMenuItem<int>(
                  value: 0,
                  child: ListTile(
                    title: Text('Log out', style: TextStyle(fontSize: 6.sp)),
                    leading: const Icon(Icons.logout_rounded),
                  )),
            ]);
  }
}

void onSelected(BuildContext context, int item) {
  switch (item) {
    case 0:
      Navigator.of(context)
          .push(MaterialPageRoute(builder: ((context) => const EditAnwser())));
      break;
  }
}
