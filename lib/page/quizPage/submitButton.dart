import 'package:bebras_task/constant.dart';
import 'package:bebras_task/page/scorePage/scorePageScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final Function getScore;
  const SubmitButton({Key? key, required this.getScore}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: Size(130, 40),
            primary: appBlue,
            elevation: 3,
            shadowColor: Color.fromRGBO(0, 0, 0, 100),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return ScorePageScreen(
              score: getScore(),
            );
          }));
        },
        child: Text(
          "Selesai",
          style: TextStyle(
            fontFamily: "Roboto",
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: appWhite,
          ),
        ),
      ),
    );
  }
}
