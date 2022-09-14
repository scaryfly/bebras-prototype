import 'package:bebras_task/page/quizPage/quizPageScreen.dart';
import 'package:flutter/material.dart';

class LevelButton extends StatelessWidget {
  final String text;
  final Color color;
  final bool isDisabled;
  final lvlIndex;
  const LevelButton(
      {Key? key,
      required this.text,
      required this.color,
      required this.isDisabled,
      this.lvlIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: color,
                onPrimary: Colors.white,
                elevation: 3,
                shadowColor: Color.fromRGBO(0, 0, 0, 100),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            onPressed: isDisabled == false
                ? () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return QuizPageScreen(
                        lvlIndex: lvlIndex,
                      );
                    }));
                  }
                : null,
            child: Container(
              width: 200,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text(
                      text,
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
