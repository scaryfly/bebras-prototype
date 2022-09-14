import 'package:bebras_task/constant.dart';
import 'package:bebras_task/page/homePage/levelButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectLevelPage extends StatefulWidget {
  const SelectLevelPage({Key? key}) : super(key: key);

  @override
  _SelectLevelPageState createState() => _SelectLevelPageState();
}

class _SelectLevelPageState extends State<SelectLevelPage> {
  var _name, _level;
  var _currentLvl = '1';
  List<String> lvlList = [];
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _name != null
                  ? Text(
                      "Halo " + _name + ",",
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                    )
                  : Text(
                      "Halo " + ",",
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                    ),
              _level != null
                  ? Text(
                      "Yuk Mulai Latihan di tingkat " + _level,
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                    )
                  : Text(
                      "Yuk Mulai Latihan di tingkat ",
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                    ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 60),
          child: LevelButton(
            text: "Level 1",
            color: appRed,
            isDisabled: false,
            lvlIndex: lvlList.length != 0 ? lvlList[0] : '',
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 30),
          child: LevelButton(
            text: "Level 2",
            color: appBlue,
            isDisabled: _currentLvl != '1' ? false : true,
            lvlIndex: lvlList.length != 0 ? lvlList[1] : '',
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 30),
          child: LevelButton(
            text: "Level 3",
            color: appRed,
            isDisabled: _currentLvl == '3' ? false : true,
            lvlIndex: lvlList.length != 0 ? lvlList[2] : '',
          ),
        ),
      ],
    );
  }

  void _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _name = prefs.getString('name');
      _level = prefs.getString('level');
      _currentLvl = prefs.getString('currentLvl')!;
      if (_level == 'siaga') {
        lvlList = siagaLvl;
      } else if (_level == 'penegak') {
        lvlList = penegakLvl;
      } else if (_level == 'penggalang') {
        lvlList = penggalangLvl;
      } else if (_level == 'sikecil') {
        lvlList = sikecilLvl;
      }
    });
  }
}
