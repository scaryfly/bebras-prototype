import 'package:bebras_task/provider/multiChoiceProivder.dart';
import 'package:bebras_task/provider/singleChoiceProvider.dart';
import 'package:bebras_task/provider/textAnswerProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavButton extends StatelessWidget {
  final Function functionTap;
  final String text;
  final Function getAnswer;
  final int questionI;
  final String typeQ;
  final Color textColor;
  final Color buttonColor;
  final bool isDisbaled;
  const NavButton(
      {Key? key,
      required this.functionTap,
      required this.text,
      required this.textColor,
      required this.buttonColor,
      required this.getAnswer,
      required this.questionI,
      required this.typeQ,
      required this.isDisbaled})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var providerMulti = Provider.of<MultiChoiceProvider>(context);
    var providerSingle = Provider.of<SingleChoiceProvider>(context);
    var providerText = Provider.of<TextAnswerProvider>(context);

    return Container(
      margin: EdgeInsets.all(10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: Size(130, 40),
            primary: buttonColor,
            elevation: 3,
            shadowColor: Color.fromRGBO(0, 0, 0, 100),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        onPressed: isDisbaled
            ? null
            : () {
                if (typeQ == '1') {
                  providerSingle.setSelectedButton(getAnswer(questionI));
                } else if (typeQ == '2') {
                  providerMulti.resetSelectedButton(getAnswer(questionI));
                } else {
                  providerText.setSelectedButton(getAnswer(questionI));
                }

                functionTap();
              },
        child: Text(
          text,
          style: TextStyle(
            fontFamily: "Roboto",
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
