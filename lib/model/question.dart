import 'dart:convert';

class Question {
  String typeQ;
  String bodyQ;
  List<String> optionQ;
  List<int> scoreQ;

  Question(
      {required this.bodyQ,
      required this.typeQ,
      required this.optionQ,
      required this.scoreQ});

  Question.fromSnapshot(Map<String, dynamic> data)
      : typeQ = data['type_q'],
        bodyQ = data['body_q'],
        optionQ = List.from(data['option_q']),
        scoreQ = List.from(data['score_q']);

  static Map<String, dynamic> toMap(Question question) => {
        'bodyQ': question.bodyQ,
        'typeQ': question.typeQ,
        'optionQ': question.optionQ,
        'scoreQ': question.scoreQ,
      };

  factory Question.fromJson(Map<String, dynamic> jsonData) {
    return Question(
        bodyQ: jsonData['bodyQ'],
        typeQ: jsonData['typeQ'],
        optionQ: List.from(jsonData['optionQ']),
        scoreQ: List.from(jsonData['scoreQ']));
  }

  static String encode(List<Question> questions) => json.encode(
        questions
            .map<Map<String, dynamic>>((question) => Question.toMap(question))
            .toList(),
      );

  static List<Question> decode(String questions) =>
      (json.decode(questions) as List<dynamic>)
          .map<Question>((item) => Question.fromJson(item))
          .toList();
}
