import 'package:bebras_task/constant.dart';
import 'package:bebras_task/page/landingPage/background.dart';
import 'package:bebras_task/page/landingPage/formNameScreen.dart';
import 'package:flutter/material.dart';

class LandingPageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: Container(
          margin: EdgeInsets.fromLTRB(30, 70, 30, 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "HALO!",
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                ),
              ),
              Text(
                "Selamat datang di aplikasi PANDAI!",
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 15,
                ),
              ),
              Text(
                "PANDAI adalah aplikasi untuk mengasah logika berpikir komputasional.",
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 15,
                ),
              ),
              Text(
                "Yuk cari tahu seberapa tajam logikamu!",
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 15,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 70),
                    child: Image(
                      image: AssetImage("assets/images/logo-bebrasid-2.png"),
                      fit: BoxFit.cover,
                      width: 200,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 100),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: appRed,
                          onPrimary: Colors.white,
                          elevation: 3,
                          shadowColor: Color.fromRGBO(0, 0, 0, 100),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return FormNameScreen();
                        }));
                      },
                      child: Container(
                        width: 150,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Text(
                                "AYO MULAI",
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
