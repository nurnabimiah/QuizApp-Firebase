
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quizapp_project/model_class/teacher_model.dart';

import '../model_class/student_model.dart';

class AuthServices{

  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static User? get currentUser => _auth.currentUser;





  static Future <void> logOutStudents(){

    return _auth.signOut();
  }


  static Future<User?> loginAdStudent(String email, String pass) async{
    final credential =  await _auth.signInWithEmailAndPassword(email: email, password: pass);
    return credential.user;
  }



  static Future <User?> registerUser(String email, String pass) async{
    final creadential = await _auth.createUserWithEmailAndPassword(email: email, password: pass);
    return creadential.user;
  }


  static Future<StudentModel> signUpWithEmail(String email,String password,String name,String phoneNumber) async{

    UserCredential result = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    return StudentModel(
        email: email,
        name: name,
        phoneNumber: phoneNumber,
        password:password,
        uid: result.user!.uid
    );

  }


  //..........for teacher.....


  static Future<User?> loginTeacher(String email, String pass) async{
    final credential =  await _auth.signInWithEmailAndPassword(email: email, password: pass);
    return credential.user;
  }

  static Future <User?> registerTeacher(String email, String pass) async{
    final creadential = await _auth.createUserWithEmailAndPassword(email: email, password: pass);
    return creadential.user;
  }


  static Future<TeacherModelClass> teacherSignUpWithEmail(String email,String password,String name,String phoneNumber) async{

    UserCredential result = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    return TeacherModelClass(
        email: email,
        name: name,
        phoneNumber: phoneNumber,
        password:password,
        uid: result.user!.uid
    );

  }


  static Future <void> logOutTeacher(){

    return _auth.signOut();
  }





}




