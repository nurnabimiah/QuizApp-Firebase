

import 'package:flutter/cupertino.dart';
import 'package:quizapp_project/db_helper/db.dart';
import 'package:quizapp_project/model_class/student_model.dart';

class StudentSignUpProvider extends ChangeNotifier{

  Future<void> addStudents(StudentModel studentModel){
    return DBHelper.addNewStudents(studentModel);
  }
}