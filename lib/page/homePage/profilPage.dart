import 'package:bebras_task/constant.dart';
import 'package:bebras_task/page/landingPage/selectLevel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var _name, _level;
  late TextEditingController namaController;
  late TextEditingController levelController;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(50, 0, 50, 10),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Text(
              "Profil",
              style: TextStyle(
                fontFamily: "Roboto",
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 40),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image(
                image: AssetImage("assets/images/bebras-profile-picture.png"),
                fit: BoxFit.cover,
                width: 120,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    child: Text(
                  "Nama :",
                  style: TextStyle(
                    fontFamily: "Roboto",
                  ),
                )),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.black54, width: 1))),
                  child: _name != null
                      ? Text(
                          _name,
                          style: TextStyle(
                            fontFamily: "Roboto",
                          ),
                        )
                      : Text(
                          '',
                          style: TextStyle(
                            fontFamily: "Roboto",
                          ),
                        ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text(
                      "Tingkat :",
                      style: TextStyle(
                        fontFamily: "Roboto",
                      ),
                    )),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.black54, width: 1))),
                  child: _level != null
                      ? Text(
                          _level,
                          style: TextStyle(
                            fontFamily: "Roboto",
                          ),
                        )
                      : Text(
                          '',
                          style: TextStyle(
                            fontFamily: "Roboto",
                          ),
                        ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 120),
                  child: Center(
                    child: Container(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: appRed,
                            onPrimary: Colors.white,
                            elevation: 3,
                            shadowColor: Color.fromRGBO(0, 0, 0, 100),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return SelectLevel(name: _name);
                          }));
                        },
                        child: Container(
                            width: 200,
                            height: 50,
                            child: Center(
                              child: Container(
                                child: Text(
                                  "RESET TINGKAT",
                                  style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            )),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _name = prefs.getString('name');
      _level = prefs.getString('level')!.toUpperCase();
      namaController = TextEditingController(text: _name);
      levelController = TextEditingController(text: _level);
    });
  }
}
