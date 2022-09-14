import 'package:flutter/cupertino.dart';

class TextAnswerProvider extends ChangeNotifier {
  late String answer;
  TextAnswerProvider() {
    answer = '';
  }
  void setSelectedButton(String temp) {
    answer = temp;
    notifyListeners();
  }
}
