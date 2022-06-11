import 'package:flutter/cupertino.dart';

class Engage with ChangeNotifier {
  bool switcher = false;
  bool switcher1 = false;
  bool switcher2 = false;
  bool switcher3 = false;

  void toggle() {
    switcher = !switcher;
    notifyListeners();
  }

  void toggle1() {
    switcher1 = !switcher1;
    notifyListeners();
  }

  void toggle2() {
    switcher2 = !switcher2;
    notifyListeners();
  }

  void checkerToggle(bool swi) {
    switcher3 = swi;
    notifyListeners();
  }
}
