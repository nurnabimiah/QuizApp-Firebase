/*
class QuizModel {
  String? subjects;
  int? questionNumber;
  String? question;
  List<String>? options;
  int? answer;

  QuizModel(
      {this.subjects,
      this.questionNumber,
      this.question,
      this.options,
      this.answer});

  factory QuizModel.fromJson(Map<String, dynamic> json) {
    return QuizModel(
      subjects: json['subjects'],
      questionNumber: json['qustionNumber'],
      question: json['question'],
      options: List<String>.from(json['options']),
      answer: json['answer'],
    );
  }

  Map<dynamic, dynamic> toMap() {
    var map = <String, dynamic>{
      'subjects': subjects,
      'questionNumber': questionNumber,
      'question': question,
      'options': options,
      'answer': answer,
    };
    return map;
  }
}
*/

//....new code.......
class QuizModel {
  String? subjects;
  int? questionNumber;
  String? question;
  List<String>? options;
  int? answer;
  int selectedOptionIndex; // New field to store the selected option index

  QuizModel({
    this.subjects,
    this.questionNumber,
    this.question,
    this.options,
    this.answer,
    this.selectedOptionIndex = -1, // Initialize with -1
  });

  factory QuizModel.fromJson(Map<String, dynamic> json) {
    return QuizModel(
      subjects: json['subjects'],
      questionNumber: json['qustionNumber'],
      question: json['question'],
      options: List<String>.from(json['options']),
      answer: json['answer'],
    );
  }

  Map<dynamic, dynamic> toMap() {
    var map = <String, dynamic>{
      'subjects': subjects,
      'questionNumber': questionNumber,
      'question': question,
      'options': options,
      'answer': answer,
    };
    return map;
  }
}