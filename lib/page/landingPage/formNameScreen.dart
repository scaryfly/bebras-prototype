import 'package:bebras_task/constant.dart';
import 'package:bebras_task/page/landingPage/background.dart';
import 'package:bebras_task/page/landingPage/selectLevel.dart';
import 'package:flutter/material.dart';

class FormNameScreen extends StatefulWidget {
  const FormNameScreen({Key? key}) : super(key: key);

  @override
  _FormNameScreenState createState() => _FormNameScreenState();
}

class _FormNameScreenState extends State<FormNameScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Background(
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
                Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 170),
                          child: Text(
                            "Siapa Nama Panggilanmu ?",
                            style: TextStyle(
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w700,
                              fontSize: 17,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 30),
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 25,
                                height: 25,
                                child: Image(
                                  image:
                                      AssetImage("assets/images/user-icon.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                width: 200,
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Masukan Nama Panggilanmu';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      hintText: "Nama Panggilan"),
                                  onSaved: (value) =>
                                      setState(() => _name = value!),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 200),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: appRed,
                                onPrimary: Colors.white,
                                elevation: 3,
                                shadowColor: Color.fromRGBO(0, 0, 0, 100),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return SelectLevel(
                                    name: _name,
                                  );
                                }));
                              }
                            },
                            child: Container(
                              width: 150,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      "LANJUTKAN",
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
                    )),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
