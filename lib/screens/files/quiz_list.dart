/*

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quizapp_project/screens/files/question_screen.dart';

import '../teacher_screen/create_quiz_screen.dart';


class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>QuizForm()));
        },
        child: Icon(Icons.add),

      ),
      appBar: AppBar(
        title: Text('Teacher Quiz List'),
      ),
      body: QuizList(),
    );
  }
}

class QuizList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('quizzes').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('Error fetching quiz data.'),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        final quizDocs = snapshot.data!.docs;
        if (quizDocs.isEmpty) {
          return Center(
            child: Text('No quizzes found.'),
          );
        }

        return ListView.builder(
          itemCount: quizDocs.length,
          itemBuilder: (context, index) {
            final quizData = quizDocs[index].data() as Map<String, dynamic>;
            final questionNumber = quizData['questionNumber'];
            final question = quizData['question'];
            final options = quizData['options'] as List<dynamic>;

            return ListTile(
              title: Text('Question $questionNumber',style: TextStyle(color: Colors.black),),
              subtitle: Text(question,style: TextStyle(color: Colors.black)),
              trailing: ElevatedButton(
                onPressed: () {
                  // Navigate to the quiz page with the selected quiz data
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizPage(
                        questionNumber: questionNumber,
                        question: question,
                        options: options,
                      ),
                    ),
                  );
                },
                child: Text('Start Quiz'),
              ),
            );
          },
        );
      },
    );
  }
}*/
