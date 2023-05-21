

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quizapp_project/model_class/student_model.dart';

class DBHelper{
  
  static const _collectionStudents = 'students';
  static final FirebaseFirestore _db = FirebaseFirestore.instance;
  
  static Future<void> addNewStudents(StudentModel studentModel){
    return _db.collection(_collectionStudents).doc(studentModel.uid).set(studentModel.toMap());
    
  }
  
  
  
  
}