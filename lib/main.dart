

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quizapp_project/provider/quiz_provider.dart';
import 'package:quizapp_project/provider/student_signup_provider.dart';
import 'package:quizapp_project/provider/teacher_signup_provider.dart';
import 'package:quizapp_project/screens/files/quiz_list.dart';
import 'package:quizapp_project/screens/splash_screen.dart';
import 'package:quizapp_project/screens/student_screen/student_quiz_list_screen.dart';
import 'package:quizapp_project/screens/subject_wise_list/bangla_quiz_list.dart';
import 'package:quizapp_project/screens/teacher_screen/create_quiz_screen.dart';
import 'package:quizapp_project/screens/teacher_screen/quiz_list_teacher.dart';


void main()async  {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
      providers: [
          ChangeNotifierProvider(create: (context) => StudentSignUpProvider()),
          ChangeNotifierProvider(create: (context) => TeacherSignUpProvider()),
          ChangeNotifierProvider(create: (context) => QuizProvider()..getALlQuestions()..getAllSubjectsName()),
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
          home:SplashScreen(),
        );
      },

    );
  }
}



















