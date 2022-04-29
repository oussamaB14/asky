import 'package:asky/views/QuestionViews/EditQuestion.dart';
import 'package:flutter/material.dart';

class QuestionPopMenu extends StatefulWidget {
  const QuestionPopMenu({Key? key}) : super(key: key);

  @override
  State<QuestionPopMenu> createState() => _QuestionPopMenuState();
}

class _QuestionPopMenuState extends State<QuestionPopMenu> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
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
          .push(MaterialPageRoute(builder: ((context) => EditQuestion())));
      break;
  }
}

