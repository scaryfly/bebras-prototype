import 'package:bebras_task/constant.dart';
import 'package:bebras_task/page/homePage/homePageScreen.dart';
import 'package:bebras_task/page/landingPage/background.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectLevel extends StatefulWidget {
  final String name;

  SelectLevel({required this.name});

  @override
  _SelectLevelState createState() => _SelectLevelState();
}

class _SelectLevelState extends State<SelectLevel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Background(
            child: Container(
      margin: EdgeInsets.fromLTRB(70, 50, 50, 50),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Image(
                  image: AssetImage("assets/images/logo-bebras-ind.png"),
                  fit: BoxFit.cover,
                  width: 150,
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 120),
            child: Text(
              "Pilih Tingkat Soalmu!",
              style: TextStyle(
                fontFamily: "Roboto",
                fontWeight: FontWeight.w700,
                fontSize: 17,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 50),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 3,
                  shadowColor: Color.fromRGBO(0, 0, 0, 1),
                  primary: Colors.blue[200],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: () {
                _saveDataLocal("sikecil", widget.name);
              },
              child: Container(
                width: 200,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 10, 15, 10),
                      width: 30,
                      height: 30,
                      child: Image(
                        image: AssetImage("assets/images/logo-bebrasid-2.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "SiKecil",
                        style: TextStyle(
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: appWhite),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 40),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 3,
                  shadowColor: Color.fromRGBO(0, 0, 0, 1),
                  primary: appRed,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: () {
                _saveDataLocal("siaga", widget.name);
              },
              child: Container(
                width: 200,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 10, 15, 10),
                      width: 30,
                      height: 30,
                      child: Image(
                        image: AssetImage("assets/images/logo-bebrasid-2.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "Siaga",
                        style: TextStyle(
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: appWhite),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 40),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 3,
                  shadowColor: Color.fromRGBO(0, 0, 0, 1),
                  primary: appBlue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: () {
                _saveDataLocal("penggalang", widget.name);
              },
              child: Container(
                width: 200,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 10, 15, 10),
                      width: 30,
                      height: 30,
                      child: Image(
                        image: AssetImage("assets/images/logo-bebrasid-2.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "Penggalang",
                        style: TextStyle(
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: appWhite),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 40),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 3,
                  shadowColor: Color.fromRGBO(0, 0, 0, 1),
                  primary: appGrey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: () {
                _saveDataLocal("penegak", widget.name);
              },
              child: Container(
                width: 200,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 10, 15, 10),
                      width: 30,
                      height: 30,
                      child: Image(
                        image: AssetImage("assets/images/logo-bebrasid-2.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "Penegak",
                        style: TextStyle(
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: appWhite),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    )));
  }

  void _saveDataLocal(String level, String name) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('level', level);
    prefs.setString('name', name);
    prefs.setString('currentLvl', '1');
    if (prefs.containsKey('questions')) {
      prefs.remove('questions');
    }
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return HomePageScreen();
    }));
  }
}
