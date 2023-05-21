import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:quizapp_project/screens/const_file/app_textstyle.dart';
import 'package:quizapp_project/screens/student_screen/quiz_list_screen.dart';
import 'package:quizapp_project/screens/student_screen/registration_screen.dart';

import '../../widgets/text_formfiled_inputdecoration.dart';

class StudentLoginScreen extends StatefulWidget {
  const StudentLoginScreen({Key? key}) : super(key: key);

  @override
  State<StudentLoginScreen> createState() => _StudentLoginScreenState();
}

class _StudentLoginScreenState extends State<StudentLoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.w, top: 40),
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    Lottie.asset('images/animations/student_login.json',
                        height: 200.h, width: double.infinity),
                    Text(
                      'Student Login',
                      style: studentLoginPgeHeaderTextStyle(),
                    ),

                    SizedBox(height: 30.h,),
                    TextFormField(
                      controller: _emailController,
                      validator: (value) {
                        if(value == null || value.isEmpty) {
                          return 'This filed must not be empty';
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.black),
                      decoration: textFormfiledInputeDecoration(
                        'email',
                        prefixIcon: Icon(Icons.email,color: Colors.black,)
                      ),

                    ),
                    SizedBox(height: 15.h,),

                    TextFormField(
                      controller: _passwordController,
                      validator: (value) {
                        if(value == null || value.isEmpty) {
                          return 'This filed must not be empty';
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.black),
                      decoration: textFormfiledInputeDecoration(
                          'password',
                          prefixIcon: Icon(Icons.lock,color: Colors.black,)
                      ),

                    ),





                    SizedBox(
                      height: 20.h,
                    ),



                    ElevatedButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>QuizListScreen()));
                    }, child: Text('Login')),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't Have an Account ?",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        TextButton(onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentRegistrationScreen()));
                        }, child: Text('Sign Up',style: TextStyle(fontSize: 16.sp),))
                      ],
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }


}