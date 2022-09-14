import 'package:flutter/cupertino.dart';

class SingleChoiceProvider extends ChangeNotifier {
  late int selectedButton;
  SingleChoiceProvider() {
    selectedButton = 10;
  }
  void setSelectedButton(int index) {
    selectedButton = index;
    notifyListeners();
  }
}
