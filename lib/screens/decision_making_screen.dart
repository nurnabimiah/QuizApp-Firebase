
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:quizapp_project/screens/const_file/app_textstyle.dart';
import 'package:quizapp_project/screens/student_screen/login_screen.dart';

import 'const_file/app_all_color.dart';

class DecisionMakingScreen extends StatefulWidget {
  const DecisionMakingScreen({Key? key}) : super(key: key);

  @override
  State<DecisionMakingScreen> createState() => _DecisionMakingScreenState();
}

class _DecisionMakingScreenState extends State<DecisionMakingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding:  EdgeInsets.only(top: 30.0.h),
          child: Column(
            children: [
              Lottie.asset('images/animations/decisionmaking.json',height: 200.h,width: double.infinity),
              Container(
                height: 180,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12.r)),
                  color: AppColor.appPrimaryColor
                ),

                child: Column(
                 mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    Text('Select Your Profession ?',style: appHeaderTextStyle(),),
                    Padding(
                      padding:  EdgeInsets.only(bottom: 32.0.h,top: 10.h,left: 16.h,right: 16.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentLoginScreen()));
                          }, child: Text('Student')),
                          ElevatedButton(onPressed: (){}, child: Text('Teacher')),
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
