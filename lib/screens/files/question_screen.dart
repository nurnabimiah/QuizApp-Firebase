import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../teacher_screen/create_quiz_screen.dart';
import 'leader_board_screen.dart';

class QuizPage extends StatefulWidget {
  final int questionNumber;
  final String question;
  final List<dynamic> options;

  QuizPage({
    required this.questionNumber,
    required this.question,
    required this.options,
  });

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int? selectedOptionIndex;

  void _finishQuiz() {
    // Calculate the user's points based on the selected options
    int userPoints = 0;
    if (selectedOptionIndex != null) {
      final correctAnswerIndex = widget.options.indexOf(widget.options[widget.questionNumber - 1]);
      if (selectedOptionIndex == correctAnswerIndex) {
        userPoints = 1;
      }
    }

    // Navigate to the leaderboard screen with the user's points
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LeaderboardScreen(userPoints: userPoints),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(


        appBar: AppBar(
          elevation: 0,
          title: Text('Question ${widget.questionNumber}'),
        ),
        body: Column(
          children: [
            Text(widget.question,style: TextStyle(color: Colors.black),),
            SizedBox(height: 16),
            Column(
              children: widget.options.asMap().entries.map((entry) {
                final index = entry.key;
                final option = entry.value;
                final isSelected = selectedOptionIndex == index;

                return ListTile(
                  title: Text(option.toString(),style: TextStyle(color:Colors.black),),
                  tileColor: isSelected ? Colors.red : null,
                  onTap: () {
                    setState(() {
                      selectedOptionIndex = index;
                    });
                  },
                );
              }).toList(),
            ),
            ElevatedButton(
              onPressed: _finishQuiz,
              child: Text('Finish Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}

/*
class LeaderboardScreen extends StatelessWidget {
  final int userPoints;

  LeaderboardScreen({required this.userPoints});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Leaderboard'),
      ),
      body: Center(
        child: Text(
          'Your Points: $userPoints',
          style: TextStyle(fontSize: 24.sp,color: Colors.red),
        ),
      ),
    );
  }
}*/
