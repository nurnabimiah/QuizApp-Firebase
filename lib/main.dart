/*


import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quizapp_project/provider/student_signup_provider.dart';
import 'package:quizapp_project/provider/teacher_signup_provider.dart';
import 'package:quizapp_project/screens/splash_screen.dart';
import 'package:quizapp_project/screens/teacher_screen/create_quiz_screen.dart';

void main()async  {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
      providers: [
          ChangeNotifierProvider(create: (context) => StudentSignUpProvider()),
          ChangeNotifierProvider(create: (context) => TeacherSignUpProvider()),
      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Quiz App',
          theme: ThemeData(
            primarySwatch: Colors.red,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          home: QuizForm(),
        );
      },

    );
  }
}


*/




import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
      ),
      body: QuizList(),
    );
  }
}

class QuizList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('quizzes').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('Error fetching quiz data.'),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        final quizDocs = snapshot.data!.docs;
        if (quizDocs.isEmpty) {
          return Center(
            child: Text('No quizzes found.'),
          );
        }

        return ListView.builder(
          itemCount: quizDocs.length,
          itemBuilder: (context, index) {
            final quizData = quizDocs[index].data() as Map<String, dynamic>;
            final questionNumber = quizData['questionNumber'];
            final question = quizData['question'];
            final options = quizData['options'] as List<dynamic>;

            return ListTile(
              title: Text('Question $questionNumber'),
              subtitle: Text(question),
              trailing: ElevatedButton(
                onPressed: () {
                  // Navigate to the quiz page with the selected quiz data
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizPage(
                        questionNumber: questionNumber,
                        question: question,
                        options: options,
                      ),
                    ),
                  );
                },
                child: Text('Start Quiz'),
              ),
            );
          },
        );
      },
    );
  }
}



class LeaderboardScreen extends StatelessWidget {
  final int userPoints;

  LeaderboardScreen({required this.userPoints});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leaderboard'),
      ),
      body: Center(
        child: Text(
          'Your Points: $userPoints',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

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
    return Scaffold(
      appBar: AppBar(
        title: Text('Question ${widget.questionNumber}'),
      ),
      body: Column(
        children: [
          Text(widget.question),
          SizedBox(height: 16),
          Column(
            children: widget.options.asMap().entries.map((entry) {
              final index = entry.key;
              final option = entry.value;
              final isSelected = selectedOptionIndex == index;

              return ListTile(
                title: Text(option.toString()),
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
    );
  }
}








// class QuizPage extends StatefulWidget {
//   final int questionNumber;
//   final String question;
//   final List<dynamic> options;
//
//   QuizPage({
//     required this.questionNumber,
//     required this.question,
//     required this.options,
//   });
//
//   @override
//   _QuizPageState createState() => _QuizPageState();
// }

// class _QuizPageState extends State<QuizPage> {
//   int? selectedOptionIndex;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Question ${widget.questionNumber}'),
//       ),
//       body: Column(
//         children: [
//           Text(widget.question),
//           SizedBox(height: 16),
//           Column(
//             children: widget.options.asMap().entries.map((entry) {
//               final index = entry.key;
//               final option = entry.value;
//               final isSelected = selectedOptionIndex == index;
//
//               return ListTile(
//                 title: Text(option.toString()),
//                 tileColor: isSelected ? Colors.red : null,
//                 onTap: () {
//                   setState(() {
//                     selectedOptionIndex = index;
//                   });
//                 },
//               );
//             }).toList(),
//           ),
//         ],
//       ),
//     );
//   }
// }


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: QuizScreen(),
    );
  }
}
