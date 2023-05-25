


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../const_file/app_textstyle.dart';
import '../../../model_class/quiz_model_class.dart';
import '../../../widgets/my_drawer.dart';

import '../../scoreboard_screen.dart';
import '../../subject_wise_list/bangla_quiz_list.dart';



class MathQuizList1 extends StatefulWidget {
  const MathQuizList1({Key? key}) : super(key: key);

  @override
  State<MathQuizList1> createState() => _MathQuizList1State();
}

class _MathQuizList1State extends State<MathQuizList1> {
  List<QuizModel> mathquizList = [];

  @override
  void initState() {
    super.initState();
    fetchQuizData();
  }

  Future<void> fetchQuizData() async {
    List<QuizModel> fetchedQuizList = await QuizDataProvider.fetchQuizData('math');

    setState(() {
      mathquizList = fetchedQuizList;
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
    for (QuizModel quiz in mathquizList) {
      if (quiz.selectedOptionIndex == quiz.answer) {
        score++; // Increment the score if the selected option is the correct answer
      }
    }
    return score;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Math',style: TextStyle(fontSize: 14.sp),),
        actions: [
          TextButton(
            onPressed: submitQuiz,
            child: Text('Submit', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body:mathquizList.isEmpty?Center(child:CircularProgressIndicator() ,): Padding(
        padding: EdgeInsets.only(left: 14.0.w, right: 14.0.w, top: 30.h),
        child: ListView.separated(
          itemCount: mathquizList.length,
          separatorBuilder: (context, index) => SizedBox(height: 8.0),
          itemBuilder: (context, index) {
            QuizModel quiz = mathquizList[index];
            return Container(
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        quiz.question ?? '',
                        style: quizHeaderTextStyle(15.sp),
                      ),
                    ],
                  ),
                  for (int i = 0; i < quiz.options!.length; i++)
                    ListTile(
                      title: Text(
                        quiz.options![i],
                        style: TextStyle(
                          color: quiz.selectedOptionIndex == i ? Colors.red : Colors.black,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          quiz.selectedOptionIndex = i; // Update the selected option index for this quiz
                        });
                      },
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
