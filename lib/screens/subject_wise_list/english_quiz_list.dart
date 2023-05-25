/*


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../model_class/quiz_model_class.dart';
import '../const_file/app_textstyle.dart';
import '../scoreboard_screen.dart';

class EnglishQuizList extends StatefulWidget {
  const EnglishQuizList({Key? key}) : super(key: key);

  @override
  State<EnglishQuizList> createState() => _EnglishQuizListState();
}

class _EnglishQuizListState extends State<EnglishQuizList> {

  List<QuizModel> englisquizList = [];

  @override
  void initState() {
    super.initState();
    fetchQuizData();
  }

  Future<void> fetchQuizData() async {
    List<QuizModel> fetchedQuizList = await QuizDataProvider.fetchQuizData('english');

    setState(() {
      englisquizList = fetchedQuizList;
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
    for (QuizModel quiz in englisquizList) {
      if (quiz.selectedOptionIndex == quiz.answer) {
        score++; // Increment the score if the selected option is the correct answer
      }
    }
    return score;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('English'),
        actions: [
          TextButton(
            onPressed: submitQuiz,
            child: Text('Submit', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 14.0.w, right: 14.0.w, top: 30.h),
        child: ListView.separated(
          itemCount: englisquizList.length,
          separatorBuilder: (context, index) => SizedBox(height: 8.0),
          itemBuilder: (context, index) {
            QuizModel quiz = englisquizList[index];
            return Container(
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                          'Question : ', style: quizHeaderTextStyle(18.sp)
                      ),
                      Text(
                        quiz.question ?? '',
                        style: quizHeaderTextStyle(18.sp),
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


class QuizDataProvider {
  static Future<List<QuizModel>> fetchQuizData(String subject) async {
    List<QuizModel> quizList = [];

    FirebaseFirestore firestore = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot = await firestore
        .collection('Question')
        .where('subjects', isEqualTo: subject)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;
        if (data != null) {
          QuizModel quiz = QuizModel.fromJson(data);
          quizList.add(quiz);
        }
      });
    }


    return quizList;
  }
}*/
