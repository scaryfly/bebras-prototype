import 'package:bebras_task/constant.dart';
import 'package:bebras_task/page/homePage/homePageScreen.dart';
import 'package:bebras_task/page/landingPage/background.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScorePageScreen extends StatelessWidget {
  final double score;
  const ScorePageScreen({Key? key, required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Background(
      child: SafeArea(
        child: Container(
          margin: EdgeInsets.fromLTRB(70, 40, 70, 70),
          child: Column(
            children: <Widget>[
              Center(
                child: Container(
                  child: Image(
                    image: AssetImage("assets/images/logo-bebras-ind.png"),
                    fit: BoxFit.cover,
                    width: 213,
                  ),
                ),
              ),
              Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 100),
                      child: Center(
                        child: Text(
                          "Skor : " + (score * 100).toStringAsFixed(2),
                          style: TextStyle(
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w700,
                              fontSize: 30,
                              color: appBlue),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 50),
                      child: score <= 1 / 3
                          ? Image(
                              image: AssetImage("assets/images/bronze.png"),
                              fit: BoxFit.cover,
                              width: 95,
                            )
                          : score <= 2 / 3
                              ? Image(
                                  image: AssetImage("assets/images/silver.png"),
                                  fit: BoxFit.cover,
                                  width: 95,
                                )
                              : Image(
                                  image: AssetImage("assets/images/gold.png"),
                                  fit: BoxFit.cover,
                                  width: 95,
                                ),
                    ),
                    score <= 1 / 3
                        ? Text(
                            "Cukup Baik",
                            style: TextStyle(
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                          )
                        : score <= 2 / 3
                            ? Text(
                                "Baik",
                                style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                ),
                              )
                            : Text(
                                "Sangat Baik",
                                style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                ),
                              )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 140),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: appBlue,
                            onPrimary: Colors.white,
                            elevation: 3,
                            shadowColor: Color.fromRGBO(0, 0, 0, 100),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () async {
                          if (score > 1 / 3) {
                            final prefs = await SharedPreferences.getInstance();
                            String? currentLvlTxt =
                                prefs.getString('currentLvl');
                            var currentLvl = int.parse(currentLvlTxt!);
                            currentLvl = currentLvl + 1;
                            print("current lvl : " + currentLvl.toString());
                            prefs.setString(
                                'currentLvl', currentLvl.toString());
                          }
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return HomePageScreen();
                          }));
                        },
                        child: Container(
                          width: 180,
                          height: 30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "Kembali",
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
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
