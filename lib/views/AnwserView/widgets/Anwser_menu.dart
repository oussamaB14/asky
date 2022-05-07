import 'package:asky/views/AnwserView/widgets/Edit_anwser.dart';
import 'package:asky/views/QuestionViews/EditQuestion.dart';
import 'package:flutter/material.dart';

class AnwserPopMenu extends StatefulWidget {
  const AnwserPopMenu({Key? key}) : super(key: key);

  @override
  State<AnwserPopMenu> createState() => _AnwserPopMenuState();
}

class _AnwserPopMenuState extends State<AnwserPopMenu> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        icon: const Icon(
          Icons.more_vert,
          color: Color(0xFF7f5af0),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25.0),
          ),
        ),
        onSelected: (int item) => onSelected(context, item),
        itemBuilder: (context) => const [
              PopupMenuItem<int>(
                  value: 0,
                  child: ListTile(
                    title: Text('Edit'),
                    leading: Icon(Icons.edit),
                  )),
              PopupMenuItem<int>(
                  value: 1,
                  child: ListTile(
                      title: Text('Delete'),
                      leading: Icon(
                        Icons.delete,
                      )))
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
