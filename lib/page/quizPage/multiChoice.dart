import 'package:bebras_task/constant.dart';
import 'package:bebras_task/provider/multiChoiceProivder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';

class MultipleChoice extends StatefulWidget {
  final List options;
  final Function setAnswer;
  const MultipleChoice(
      {Key? key, required this.options, required this.setAnswer})
      : super(key: key);

  @override
  _MultipleChoiceState createState() => _MultipleChoiceState();
}

class _MultipleChoiceState extends State<MultipleChoice> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MultiChoiceProvider>(context);
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
                  child: InkWell(
                    onTap: () {
                      provider.setSelectedButton(option.key);
                      widget.setAnswer(option.key);
                    },
                    child: Stack(
                      children: <Widget>[
                        Checkbox(
                          value: provider.isSelectedButton[option.key],
                          onChanged: (bool? newValue) {
                            provider.setSelectedButton(option.key);
                            widget.setAnswer(option.key);
                          },
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 50, top: 2),
                            child: Html(data: option.value.toString()))
                      ],
                    ),
                  ),
                ),
              ))),
        ]));
  }
}
