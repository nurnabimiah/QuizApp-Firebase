

class QuizModel {

  int questionNumber;
  String question;
  List<String> options;
  int answer;

  QuizModel({
    required this.questionNumber,
    required this.question,
    required this.options,
    required this.answer}
      );

  factory QuizModel.fromJson(Map<String, dynamic> json) {
    return QuizModel(
      questionNumber: json['qustionNumber'],
      question: json['question'],
      options: List<String>.from(json['options']),
      answer: json['answer'],
    );
  }

  Map<String, dynamic> toMap() {
    var map = <String,dynamic>{
      'questionNumber': questionNumber,
      'question': question,
      'options': options,
      'answer': answer,
    };
    return map;
  }


}



