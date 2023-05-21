import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:quizapp_project/screens/student_screen/login_screen.dart';

import '../../widgets/text_formfiled_inputdecoration.dart';
import '../const_file/app_textstyle.dart';

class StudentRegistrationScreen extends StatefulWidget {
  const StudentRegistrationScreen({Key? key}) : super(key: key);

  @override
  State<StudentRegistrationScreen> createState() => _StudentRegistrationScreenState();
}

class _StudentRegistrationScreenState extends State<StudentRegistrationScreen> {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phnController = TextEditingController();
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
                        height: 150.h, width: double.infinity),
                    Text(
                      'Student Sign Up',
                      style: studentLoginPgeHeaderTextStyle(),
                    ),

                    SizedBox(height: 30.h,),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      validator: (value) {
                        if(value == null || value.isEmpty) {
                          return 'This filed must not be empty';
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.black),
                      decoration: textFormfiledInputeDecoration(
                          'Email',
                          prefixIcon: Icon(Icons.email,color: Colors.black,)
                      ),

                    ),
                    SizedBox(height: 15.h,),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _nameController,
                      validator: (value) {
                        if(value == null || value.isEmpty) {
                          return 'This filed must not be empty';
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.black),
                      decoration: textFormfiledInputeDecoration(
                          'Name',
                          prefixIcon: Icon(Icons.email,color: Colors.black,)
                      ),

                    ),
                    SizedBox(height: 15.h,),

                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller:  _phnController,
                      validator: (value) {
                        if(value == null || value.isEmpty) {
                          return 'This filed must not be empty';
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.black),
                      decoration: textFormfiledInputeDecoration(
                          'Phone Number',
                          prefixIcon: Icon(Icons.lock,color: Colors.black,)
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



                    ElevatedButton(onPressed: () {}, child: Text('Sign Up')),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Do you Have an Account ?",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        TextButton(onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentLoginScreen()));
                        }, child: Text('Login',style: TextStyle(fontSize: 16.sp),))
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
