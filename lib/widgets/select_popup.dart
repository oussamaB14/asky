import 'package:asky/views/Providers/ModalSelectorProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectPopup extends StatelessWidget {
  final String name;
  final bool isSingle;
  final List optionsList;
  const SelectPopup(
      {Key? key,
      required this.name,
      required this.optionsList,
      required this.isSingle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Consumer<ModalSelectorProvider>(builder: (context, prov, child) {
      return Container(
        padding: EdgeInsets.all(height * .05),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        margin: EdgeInsets.all(height * .05),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(name),
              const Divider(
                color: Colors.black,
              ),
              for (int i = 0; i < optionsList.length; i++)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(optionsList[i]),
                    IconButton(
                        onPressed: () {
                          prov.update(optionsList[i], isSingle);
                        },
                        icon: Icon(prov.values.contains(optionsList[i])
                            ? Icons.check_box_outlined
                            : Icons.check_box_outline_blank_outlined))
                  ],
                )
            ],
          ),
        ),
      );
    });
  }
}
