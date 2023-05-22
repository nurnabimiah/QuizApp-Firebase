import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:quizapp_project/screens/student_screen/login_screen.dart';
import 'package:quizapp_project/screens/teacher_screen/teacher_registration_screen.dart';

import '../../auth/auth_services.dart';
import '../../widgets/text_formfiled_inputdecoration.dart';
import '../const_file/app_textstyle.dart';
import 'create_quiz_screen.dart';

class TeacherLoginScreen extends StatefulWidget {
  const TeacherLoginScreen({Key? key}) : super(key: key);

  @override
  State<TeacherLoginScreen> createState() => _TeacherLoginScreenState();
}

class _TeacherLoginScreenState extends State<TeacherLoginScreen> {


  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  String _errMsg = '';

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }



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
                      'Teacher Login',
                      style: studentLoginPgeHeaderTextStyle(),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    TextFormField(
                      controller: _emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This filed must not be empty';
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.black),
                      decoration: textFormfiledInputeDecoration('email',
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.black,
                          )),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This filed must not be empty';
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.black),
                      decoration: textFormfiledInputeDecoration('password',
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.black,
                          )),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          _loginTeacher();

                        },
                        child: Text('Login')),
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
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                        TeacherRegistrationScreen()));
                            },
                            child: Text(
                              'Sign Up',
                              style: TextStyle(fontSize: 16.sp),
                            ))
                      ],
                    ),

                    Text(_errMsg,style: TextStyle(color: Colors.teal,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
            ),
          )),
    );
  }


  void _loginTeacher() async{
    if(_formkey.currentState!.validate()){
      try{
        User? user = await AuthServices.loginTeacher(
          _emailController.text,
          _passwordController.text,
        );

        if(user!=null){
          Navigator.push(context,MaterialPageRoute(builder: (context)=>StudentLoginScreen()));
        }
        else{
          setState(() {
            _errMsg = 'Invalid email or password';
          });
        }

      } on FirebaseAuthException catch(error){
        setState(() {
          _errMsg = error.message!;
        });
      }

    }
  }

}
