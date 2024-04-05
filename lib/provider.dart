import 'package:flutter/material.dart';

class ClickProvider extends ChangeNotifier {
  bool isClicked = false;

  void isClick() {
    isClicked = !isClicked;
    notifyListeners();
  }
}
