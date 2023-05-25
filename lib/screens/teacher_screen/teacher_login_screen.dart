
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:quizapp_project/provider/teacher_signup_provider.dart';
import 'package:quizapp_project/screens/student_screen/login_screen.dart';
import 'package:quizapp_project/screens/teacher_screen/quiz_list_teacher.dart';
import 'package:quizapp_project/screens/teacher_screen/teacher_registration_screen.dart';
import '../../auth/auth_services.dart';
import '../../const_file/app_textstyle.dart';
import '../../widgets/text_formfiled_inputdecoration.dart';

import 'create_quiz_screen.dart';

class TeacherLoginScreen extends StatefulWidget {
  const TeacherLoginScreen({Key? key}) : super(key: key);

  @override
  State<TeacherLoginScreen> createState() => _TeacherLoginScreenState();
}

class _TeacherLoginScreenState extends State<TeacherLoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _errMsg = '';

  late TeacherSignUpProvider _teacherSignUpProvider;

  @override
  void didChangeDependencies() {
    _teacherSignUpProvider = Provider.of<TeacherSignUpProvider>(context, listen: false);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20.0, right: 20.w, top: 40),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Lottie.asset(
                  'images/animations/student_login.json',
                  height: 200.h,
                  width: double.infinity,
                ),
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
                      return 'This field must not be empty';
                    }
                    return null;
                  },
                  style: TextStyle(color: Colors.black),
                  decoration: textFormfiledInputeDecoration(
                    'email',
                    prefixIcon: Icon(Icons.email, color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                TextFormField(
                  controller: _passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field must not be empty';
                    }
                    return null;
                  },
                  style: TextStyle(color: Colors.black),
                  decoration: textFormfiledInputeDecoration(
                    'password',
                    prefixIcon: Icon(Icons.lock, color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                ElevatedButton(
                  onPressed: () {
                    _loginTeacher();
                  },
                  child: Text('Login'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't Have an Account ?",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TeacherRegistrationScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ),
                  ],
                ),
                if (_errMsg.isNotEmpty)
                  Text(
                    _errMsg,
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _loginTeacher() async {
    if (_formKey.currentState!.validate()) {
      try {
        User? user = await AuthServices.loginTeacher(
          _emailController.text,
          _passwordController.text,
        );

        if (user != null) {
          final status = await _teacherSignUpProvider.cheackTeacher(_emailController.text);
          if (status) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TeacherQuizListScreen()),
            );
          } else {
            setState(() {
              _errMsg = 'You are not a teacher';
            });
          }
        }
      } on FirebaseAuthException catch (error) {
        setState(() {
          _errMsg = error.message!;
        });
      }
    }
  }
}

