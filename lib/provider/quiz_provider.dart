

import 'package:flutter/cupertino.dart';

import '../db_helper/firestore_helper.dart';
import '../model_class/quiz_model_class.dart';

class QuizProvider extends ChangeNotifier{

  List <String> subjectList = [];
  List<QuizModel> questionList = [];





  Future<void> init()async{
   getAllSubjectsName();
  }


  void getAllSubjectsName(){
    DBHelper.getSubjects().listen((snapshot) {
      /* print("0 ...............................................}");
      print("-1 ...............................................${snapshot.docs[0]}");*/
      subjectList = List.generate(snapshot.docs.length, (index) =>
      snapshot.docs[index].data()['subjectName']);
      //print("1.........................}");
      notifyListeners();

    });
    /* print("2.........................}");
     print(".........................${categoryList}");*/
  }

  void getALlQuestions(){
    DBHelper.fetchAllQuestion().listen((event) {
      questionList = List.generate(event.docs.length,
              (index) =>QuizModel.fromJson(event.docs[index].data()));
      notifyListeners();
    });
  }




}