import 'package:bebras_task/constant.dart';
import 'package:bebras_task/mainPageScreen.dart';
import 'package:bebras_task/model/answer.dart';
import 'package:bebras_task/model/question.dart';
import 'package:bebras_task/page/quizPage/answerTextField.dart';
import 'package:bebras_task/page/quizPage/multiChoice.dart';
import 'package:bebras_task/page/quizPage/navButton.dart';
import 'package:bebras_task/page/quizPage/singleChoice.dart';
import 'package:bebras_task/page/landingPage/background.dart';
import 'package:bebras_task/page/quizPage/submitButton.dart';
import 'package:bebras_task/page/scorePage/scorePageScreen.dart';
import 'package:bebras_task/provider/multiChoiceProivder.dart';
import 'package:bebras_task/provider/singleChoiceProvider.dart';
import 'package:bebras_task/provider/textAnswerProvider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuizPageScreen extends StatefulWidget {
  final lvlIndex;
  const QuizPageScreen({Key? key, this.lvlIndex}) : super(key: key);

  @override
  _QuizPageScreenState createState() => _QuizPageScreenState();
}

class _QuizPageScreenState extends State<QuizPageScreen>
    with TickerProviderStateMixin {
  int _questionIndex = 0;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<Question> questions = [];
  List<Answer> answers = [];
  late AnimationController _controller;
  int levelClock = 300;
  int minutesClock = 40;
  String _level = '';

  @override
  void initState() {
    super.initState();
    getQuestions();
    _controller = AnimationController(
        vsync: this, duration: Duration(minutes: minutesClock));

    _controller.forward();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return ScorePageScreen(
            score: getScore(),
          );
        }));
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SingleChoiceProvider()),
        ChangeNotifierProvider(create: (context) => MultiChoiceProvider()),
        ChangeNotifierProvider(create: (context) => TextAnswerProvider())
      ],
      child: Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return MainPageScreen();
              })),
            ),
            title: Text(
              "${_questionIndex + 1}/${questions.length}",
              style: TextStyle(
                fontFamily: "Roboto",
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            actions: <Widget>[
              Center(
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Countdown(
                    animation: StepTween(
                      begin: levelClock, // THIS IS A USER ENTERED NUMBER
                      end: 0,
                    ).animate(_controller),
                  ),
                ),
              ),
            ],
            centerTitle: true,
            backgroundColor: Colors.white70),
        body: Background(
          child: SafeArea(
            child: questions.length == 0
                ? Center(
                    child: Text(
                      "Tunggu Sebentar...",
                      style: TextStyle(
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w700,
                          fontSize: 40,
                          color: appBlue),
                    ),
                  )
                : ListView(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(30, 0, 30, 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            questions.length != 0
                                ? Html(data: questions[_questionIndex].bodyQ)
                                : Text(questions.length.toString()),
                            Container(
                              margin: EdgeInsets.all(10),
                              child: Text(
                                'Pilihan Jawaban',
                                style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                            questions.length != 0
                                ? questions[_questionIndex].typeQ == '1'
                                    ? SingleChoice(
                                        options:
                                            questions[_questionIndex].optionQ,
                                        setAnswer: setAnswer)
                                    : questions[_questionIndex].typeQ == '2'
                                        ? MultipleChoice(
                                            options: questions[_questionIndex]
                                                .optionQ,
                                            setAnswer: setAnswerMulti,
                                          )
                                        : AnswerTextField(
                                            setAnswer: setAnswerText,
                                          )
                                : Text('loading ...'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                NavButton(
                                  functionTap: backPage,
                                  text: "back",
                                  getAnswer: _questionIndex == 0
                                      ? () {}
                                      : questions[_questionIndex - 1].typeQ ==
                                              '1'
                                          ? getAnswer
                                          : questions[_questionIndex - 1]
                                                      .typeQ ==
                                                  '2'
                                              ? getAnswerMulti
                                              : getAnswerText,
                                  questionI: _questionIndex - 1,
                                  typeQ: _questionIndex != 0
                                      ? questions[_questionIndex - 1].typeQ
                                      : "null",
                                  buttonColor: appWhite,
                                  textColor: Colors.black,
                                  isDisbaled:
                                      _questionIndex == 0 ? true : false,
                                ),
                                _questionIndex == questions.length - 1
                                    ? SubmitButton(getScore: getScore)
                                    : NavButton(
                                        functionTap: nextPage,
                                        text: "next",
                                        getAnswer: questions[_questionIndex + 1]
                                                    .typeQ ==
                                                '1'
                                            ? getAnswer
                                            : questions[_questionIndex + 1]
                                                        .typeQ ==
                                                    '2'
                                                ? getAnswerMulti
                                                : getAnswerText,
                                        questionI: _questionIndex + 1,
                                        typeQ:
                                            questions[_questionIndex + 1].typeQ,
                                        buttonColor: appBlue,
                                        textColor: appWhite,
                                        isDisbaled: _questionIndex ==
                                                questions.length - 1
                                            ? true
                                            : false,
                                      ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  void getQuestions() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _level = widget.lvlIndex;
    var _currentQ =
        prefs.containsKey('questions') ? prefs.getString('currentQ') : '';
    setTimer(_level);
    if (prefs.containsKey('questions') && _currentQ == _level) {
      // ignore: await_only_futures
      final String? questionsJson = await prefs.getString('questions');
      setState(() {
        questions = Question.decode(questionsJson!);
      });
    } else {
      await firestore.collection(_level).get().then(
          (QuerySnapshot querySnapshot) =>
              querySnapshot.docs.forEach((DocumentSnapshot doc) {
                Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
                this.setState(() {
                  questions.add(Question.fromSnapshot(data));
                });
              }));
      await prefs.setString('questions', Question.encode(questions));
      await prefs.setString('currentQ', _level);
    }
  }

  setTimer(String level) {
    setState(() {
      if (level == 'sikecil') {
        levelClock = 1800;
        minutesClock = 30;
      } else if (level == 'siaga') {
        levelClock = 2400;
        minutesClock = 40;
      } else {
        levelClock = 2700;
        minutesClock = 45;
      }
    });
  }

  void setAnswer(int optionI) {
    if (answers.length == 0) {
      answers.add(Answer(indexQuestion: _questionIndex, indexOption: optionI));
    } else {
      for (var i = 0; i < answers.length; i++) {
        if (answers[i].indexQuestion == _questionIndex) {
          answers[i].indexOption = optionI;
        } else if (i == answers.length - 1) {
          answers
              .add(Answer(indexQuestion: _questionIndex, indexOption: optionI));
        }
      }
    }
  }

  void setAnswerText(String text) {
    if (answers.length == 0) {
      answers.add(Answer(indexQuestion: _questionIndex, indexOption: text));
    } else {
      for (var i = 0; i < answers.length; i++) {
        if (answers[i].indexQuestion == _questionIndex) {
          answers[i].indexOption = text;
        } else if (i == answers.length - 1) {
          answers.add(Answer(indexQuestion: _questionIndex, indexOption: text));
        }
      }
    }
  }

  void setAnswerMulti(int optionI) {
    if (answers.length == 0) {
      answers.add(Answer(indexQuestion: _questionIndex, indexOption: optionI));
    } else {
      for (var i = 0; i < answers.length; i++) {
        if (answers[i].indexQuestion == _questionIndex &&
            answers[i].indexOption == optionI) {
          answers.removeAt(i);
          return;
        } else if (i == answers.length - 1) {
          answers
              .add(Answer(indexQuestion: _questionIndex, indexOption: optionI));
          return;
        }
      }
    }
  }

  int getAnswer(int questionI) {
    for (var i = 0; i < answers.length; i++) {
      if (answers[i].indexQuestion == questionI) {
        return answers[i].indexOption;
      }
    }
    return -1;
  }

  String getAnswerText(int questionI) {
    for (var i = 0; i < answers.length; i++) {
      if (answers[i].indexQuestion == questionI) {
        return answers[i].indexOption;
      }
    }
    return '';
  }

  List<int> getAnswerMulti(int questionI) {
    List<int> temp = [];
    for (var i = 0; i < answers.length; i++) {
      if (answers[i].indexQuestion == questionI) {
        temp.add(answers[i].indexOption);
      }
    }
    return temp;
  }

  double getScore() {
    double temp = 0;
    for (var i = 0; i < answers.length; i++) {
      if (questions[answers[i].indexQuestion].typeQ != '3') {
        temp +=
            questions[answers[i].indexQuestion].scoreQ[answers[i].indexOption];
      } else {
        if (questions[answers[i].indexQuestion].optionQ[0] ==
            answers[i].indexOption) {
          temp += questions[answers[i].indexQuestion].scoreQ[0];
        }
      }
    }
    return temp / (questions.length * 100);
  }

  void nextPage() {
    setState(() {
      _questionIndex++;
    });
  }

  void backPage() {
    setState(() {
      _questionIndex--;
    });
  }
}

class Countdown extends AnimatedWidget {
  Countdown({Key? key, required this.animation})
      : super(key: key, listenable: animation);
  final Animation<int> animation;

  @override
  build(BuildContext context) {
    Duration clockTimer = Duration(seconds: animation.value);

    String timerText =
        '${clockTimer.inMinutes.remainder(60).toString()}:${clockTimer.inSeconds.remainder(60).toString().padLeft(2, '0')}';

    return Text(
      '$timerText',
      style: TextStyle(
        fontFamily: "Roboto",
        fontWeight: FontWeight.w700,
        fontSize: 15,
        color: appBlue,
      ),
    );
  }
}
