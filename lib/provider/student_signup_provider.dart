

import 'package:flutter/cupertino.dart';
import 'package:quizapp_project/db_helper/firestore_helper.dart';
import 'package:quizapp_project/model_class/student_model.dart';
import 'package:quizapp_project/model_class/teacher_model.dart';

class StudentSignUpProvider extends ChangeNotifier{

  Future<void> addStudents(StudentModel studentModel){
    return DBHelper.addNewStudents(studentModel);
  }




}