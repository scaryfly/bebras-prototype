import 'package:bebras_task/constant.dart';
import 'package:bebras_task/page/homePage/materiPage.dart';
import 'package:bebras_task/page/homePage/profilPage.dart';
import 'package:bebras_task/page/homePage/selectLevelPage.dart';
import 'package:bebras_task/page/landingPage/background.dart';
import 'package:flutter/material.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int _selectedIndex = 1;
  static const List<Widget> _widgetOptions = <Widget>[
    MateriPage(),
    SelectLevelPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: SafeArea(
          child: Column(
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Image(
                    image: AssetImage("assets/images/logo-bebras-ind.png"),
                    fit: BoxFit.cover,
                    width: 150,
                  ),
                ),
              ),
              _widgetOptions.elementAt(_selectedIndex),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: TextStyle(fontFamily: "Roboto"),
        unselectedLabelStyle: TextStyle(fontFamily: "Roboto"),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: "Materi",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: 'Latihan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: appBlue,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
