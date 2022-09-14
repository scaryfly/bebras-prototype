import 'package:bebras_task/page/homePage/homePageScreen.dart';
import 'package:bebras_task/page/landingPage/landingPageScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainPageScreen extends StatefulWidget {
  const MainPageScreen({Key? key}) : super(key: key);

  @override
  _MainPageScreenState createState() => _MainPageScreenState();
}

class _MainPageScreenState extends State<MainPageScreen> {
  var _name;
  @override
  void initState() {
    super.initState();
    _loadName();
  }

  @override
  Widget build(BuildContext context) {
    return _name != null ? HomePageScreen() : LandingPageScreen();
  }

  void _loadName() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _name = prefs.getString('name');
    });
  }
}
