import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:quizapp_project/model_class/quiz_model_class.dart';
import 'package:quizapp_project/provider/quiz_provider.dart';
import 'package:quizapp_project/screens/subject_wise_list/bangla_quiz_list.dart';
import 'package:quizapp_project/screens/teacher_screen/create_quiz_screen.dart';

import '../const_file/app_all_color.dart';

class TeacherQuizListScreen extends StatefulWidget {
  const TeacherQuizListScreen({Key? key}) : super(key: key);

  @override
  State<TeacherQuizListScreen> createState() => _TeacherQuizListScreenState();
}

class _TeacherQuizListScreenState extends State<TeacherQuizListScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(



        floatingActionButton: ElevatedButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateQuizpage()));
        }, child: Text('Create Quiz'),),

        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Quiz List ',
            style: TextStyle(
                fontSize: 16.sp,
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
                          Text('Bangla', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp, color: Colors.black,),),
                          Expanded(child: TextButton( onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>BanglaQuizList()));
                          }, child: Text('Start Quiz',style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.bold,color: Colors.red))))
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
                          Text('English', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp, color: Colors.black,),),
                          Expanded(child: TextButton( onPressed: () {  }, child: Text('Start Quiz',style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.bold,color: Colors.red))))
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
                          Text('Math', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp, color: Colors.black,),),
                          Expanded(child: TextButton( onPressed: () {  }, child: Text('Start Quiz',style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.bold,color: Colors.red))))
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
