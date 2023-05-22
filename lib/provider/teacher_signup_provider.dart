


import 'package:flutter/foundation.dart';
import 'package:quizapp_project/model_class/student_model.dart';

import '../db_helper/db.dart';
import '../model_class/teacher_model.dart';

class TeacherSignUpProvider extends ChangeNotifier{

  Future<void> addTeacher(TeacherModelClass teacherModelClass){
    return DBHelper.addNewTeacher(teacherModelClass);
  }


}