import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:quizapp_project/screens/const_file/app_all_color.dart';
import 'package:quizapp_project/screens/student_screen/quiz_screen.dart';

class QuizListScreen extends StatefulWidget {
  const QuizListScreen({Key? key}) : super(key: key);

  @override
  State<QuizListScreen> createState() => _QuizListScreenState();
}

class _QuizListScreenState extends State<QuizListScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Quiz List ',
            style: TextStyle(
                fontSize: 16.sp, fontWeight: FontWeight.w600, letterSpacing: 0.4),
          ),
        ),
        body: Padding(
          padding:  EdgeInsets.only(left: 16.0.w,right: 16.0.w,top: 20.h,bottom: 10.h),
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: 2,
            separatorBuilder: (context, index) => SizedBox(height: 8.0),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuizScreen()),
                  );
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColor.appPrimaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(5.r)),
                  ),
                  child: ListTile(
                    leading: Lottie.asset('images/animations/quizicon.json',),
                    title: Padding(
                      padding: EdgeInsets.only(top: 10.0.h),
                      child: Text(
                        'Quiz Number',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('01',style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold,color: Colors.red),),
                    ),
                  ),
                ),
              );
            },
          )
          ,

        ),
      ),
    );
  }
}
