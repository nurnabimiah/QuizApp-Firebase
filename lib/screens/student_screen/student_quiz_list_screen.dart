

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:quizapp_project/screens/student_screen/student_subwise_list/student_bangla_quiz.dart';
import 'package:quizapp_project/screens/student_screen/student_subwise_list/student_english_quiz.dart';
import 'package:quizapp_project/screens/student_screen/student_subwise_list/student_math_quiz.dart';

import '../../const_file/app_all_color.dart';
import '../../widgets/my_drawer.dart';


class StudentQuizListScreen extends StatefulWidget {
  const StudentQuizListScreen({Key? key}) : super(key: key);

  @override
  State<StudentQuizListScreen> createState() => _StudentQuizListScreenState();
}

class _StudentQuizListScreenState extends State<StudentQuizListScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Quiz List ',
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.4),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(
              left: 16.0.w, right: 16.0.w, top: 20.h, bottom: 10.h),
          child: ListView(
            shrinkWrap: true,
            children: [
              //.....bangla

              Container(
                height: 60.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColor.appPrimaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(5.r)),
                ),
                child: Row(
                  children: [
                    Lottie.asset('images/animations/quizicon.json',
                        fit: BoxFit.contain),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text('Bangla', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp, color: Colors.black,),),
                          Expanded(child: TextButton( onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>BanglaQuizList1()));
                          }, child: Text('Start Quiz',style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.bold,color: Colors.red))))
                        ],
                      ),
                    )
                  ],
                ),

              ),
              SizedBox(height: 10.h,),

              //...English...
              Container(
                height: 60.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColor.appPrimaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(5.r)),
                ),
                child: Row(
                  children: [
                    Lottie.asset('images/animations/quizicon.json',
                        fit: BoxFit.contain),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text('English', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp, color: Colors.black,),),
                          Expanded(child: TextButton( onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>EnglishQuizList1()));
                          }, child: Text('Start Quiz',style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.bold,color: Colors.red))))
                        ],
                      ),
                    )
                  ],
                ),


              ),
              SizedBox(height: 10.h,),
              //....Math
              Container(
                height: 60.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColor.appPrimaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(5.r)),
                ),
                child: Row(
                  children: [
                    Lottie.asset('images/animations/quizicon.json',
                        fit: BoxFit.contain),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text('Math', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp, color: Colors.black,),),
                          Expanded(child: TextButton( onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>MathQuizList1()));
                          }, child: Text('Start Quiz',style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.bold,color: Colors.red))))
                        ],
                      ),
                    )
                  ],
                ),


              ),
            ],
          ),
        ),
      ),
    );
  }
}


