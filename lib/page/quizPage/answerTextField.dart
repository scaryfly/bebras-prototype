import 'package:bebras_task/provider/textAnswerProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnswerTextField extends StatefulWidget {
  final Function setAnswer;
  const AnswerTextField({Key? key, required this.setAnswer}) : super(key: key);

  @override
  _AnswerTextFieldState createState() => _AnswerTextFieldState();
}

class _AnswerTextFieldState extends State<AnswerTextField> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TextAnswerProvider>(context);
    TextEditingController controller = TextEditingController()
      ..text = provider.answer;
    return Container(
        margin: EdgeInsets.fromLTRB(10, 10, 10, 30),
        child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Tulis Jawaban',
          ),
          controller: controller,
          onChanged: (text) {
            print(text);
            widget.setAnswer(text);
          },
        ));
  }
}
