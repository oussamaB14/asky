import 'package:flutter/cupertino.dart';

class ModalSelectorProvider with ChangeNotifier {
  List values = [];

  update(String value, bool isSingle) {
    if (isSingle) {
      values = [value];
    } else {
      if (values.contains(value)) {
        values.remove(value);
      } else {
        values.add(value);
      }
    }

    notifyListeners();
  }
}
