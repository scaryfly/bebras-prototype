import 'package:bebras_task/constant.dart';
import 'package:bebras_task/provider/singleChoiceProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';

class SingleChoice extends StatefulWidget {
  final List options;
  final Function setAnswer;
  const SingleChoice({
    Key? key,
    required this.options,
    required this.setAnswer,
  }) : super(key: key);

  @override
  _SingleChoiceState createState() => _SingleChoiceState();
}

class _SingleChoiceState extends State<SingleChoice> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SingleChoiceProvider>(context);
    return Container(
        margin: EdgeInsets.all(10),
        child: Column(children: <Widget>[
          ...(widget.options.asMap().entries.map((option) => Container(
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      color: null,
                      border: Border.all(color: appBlue),
                      borderRadius: BorderRadius.circular(10)),
                  child: RadioListTile(
                    value: option.key,
                    groupValue: provider.selectedButton,
                    onChanged: (val) {
                      widget.setAnswer(int.parse(val.toString()));
                      provider.setSelectedButton(int.parse(val.toString()));
                    },
                    title: Html(data: option.value),
                  ),
                ),
              ))),
        ]));
  }
}
