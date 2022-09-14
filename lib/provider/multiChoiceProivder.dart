import 'package:flutter/cupertino.dart';

class MultiChoiceProvider extends ChangeNotifier {
  late List<bool> isSelectedButton;
  MultiChoiceProvider() {
    isSelectedButton = [false, false, false, false];
  }

  void setSelectedButton(int index) {
    isSelectedButton[index] = !isSelectedButton[index];
    notifyListeners();
  }

  void resetSelectedButton(List<int> options) {
    isSelectedButton = [false, false, false, false];
    for (var option in options) {
      isSelectedButton[option] = !isSelectedButton[option];
    }
    notifyListeners();
  }
}
