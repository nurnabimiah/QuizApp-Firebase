/*
import 'package:flutter/material.dart';

import '../../model_class/quiz_model_class.dart';
import '../scoreboard_screen.dart';
import 'bangla_quiz_list.dart';

class MathQuizList extends StatefulWidget {
  const MathQuizList({Key? key}) : super(key: key);

  @override
  State<MathQuizList> createState() => _MathQuizListState();
}

class _MathQuizListState extends State<MathQuizList> {
  List<QuizModel> banglaquizList = [];

  @override
  void initState() {
    super.initState();
    fetchQuizData();
  }

  Future<void> fetchQuizData() async {
    List<QuizModel> fetchedQuizList = await QuizDataProvider.fetchQuizData('math');

    setState(() {
      banglaquizList = fetchedQuizList;
    });
  }

  void submitQuiz() {
    int score = calculateScore();

    // Navigate to the scoreboard screen and pass the score as a parameter
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ScoreboardScreen(score: score)),
    );
  }

  int calculateScore() {
    int score = 0;
    for (QuizModel quiz in banglaquizList) {
      if (quiz.selectedOptionIndex == quiz.answer) {
        score++; // Increment the score if the selected option is the correct answer
      }
    }
    return score;
  }



  @override
  Widget build(BuildContext context) {
    return();
  }
}
*/
