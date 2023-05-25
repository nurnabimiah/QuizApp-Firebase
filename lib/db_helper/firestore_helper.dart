

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quizapp_project/model_class/student_model.dart';
import 'package:quizapp_project/model_class/teacher_model.dart';

class DBHelper{
  
  static const _collectionStudents = 'students';
  static const _collectionTeacher = 'teachers';
  static const _collectSubjectList = 'subjects';
  static const _collectionAllQuestion = 'Question';


  static final FirebaseFirestore _db = FirebaseFirestore.instance;


  //admin cheack
  static Future <bool> checkTeacher (String email) async{
    final snapshot = await _db.collection(_collectionTeacher)
        .where('email',isEqualTo: email)
        .get();
    return snapshot.docs.isNotEmpty; // return krbe true
  }




  // cheack students

  static Future <bool> checStudents (String email) async{
    final snapshot = await _db.collection(_collectionStudents)
        .where('email',isEqualTo: email)
        .get();
    return snapshot.docs.isNotEmpty; // return krbe true
  }


  
  static Future<void> addNewStudents(StudentModel studentModel){
    return _db.collection(_collectionStudents).doc(studentModel.uid).set(studentModel.toMap());
    
  }



  static Future<void> addNewTeacher(TeacherModelClass teacherModelClass){
    return _db.collection(_collectionTeacher).doc(teacherModelClass.uid).set(teacherModelClass.toMap());

  }

  static Stream<QuerySnapshot<Map<String,dynamic>>> getSubjects() => _db.collection(_collectSubjectList).snapshots();

  // get all quiz


  static Stream<QuerySnapshot<Map<String,dynamic>>>
  fetchAllQuestion() => _db.collection(_collectionAllQuestion).snapshots();
  
  
}