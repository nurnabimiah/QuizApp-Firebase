import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model_class/quiz_model_class.dart';

class QuizForm extends StatefulWidget {
  @override
  _QuizFormState createState() => _QuizFormState();
}

class _QuizFormState extends State<QuizForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _questionNumberController = TextEditingController();
  TextEditingController _questionController = TextEditingController();
  List<TextEditingController> _optionControllers = [];
  TextEditingController _answerController = TextEditingController();

  @override
  void dispose() {
    _questionNumberController.dispose();
    _questionController.dispose();
    _optionControllers.forEach((controller) => controller.dispose());
    _answerController.dispose();
    super.dispose();
  }

  void _addOption() {
    setState(() {
      _optionControllers.add(TextEditingController());
    });
  }

  void _removeOption(int index) {
    setState(() {
      _optionControllers.removeAt(index);
    });
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final questionNumber = int.parse(_questionNumberController.text);
      final question = _questionController.text;
      final options = _optionControllers.map((controller) => controller.text).toList();
      final answer = int.parse(_answerController.text);

      final quizModel = QuizModel(
        questionNumber: questionNumber,
        question: question,
        options: options,
        answer: answer,
      );

      // Send quiz data to Firebase
      sendQuizToFirebase(quizModel);
    }
  }

  void sendQuizToFirebase(QuizModel quiz) async {
    await Firebase.initializeApp();

    final firestore = FirebaseFirestore.instance;
    final collection = firestore.collection('quizzes');

    final quizData = quiz.toMap();
    try {
      await collection.add(quizData);
      print('Quiz data sent successfully!');
      // Clear form fields
      _questionNumberController.clear();
      _questionController.clear();
      _optionControllers.forEach((controller) => controller.clear());
      _answerController.clear();
    } catch (error) {
      print('Failed to send quiz data: $error');
    }
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz Form'),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _questionNumberController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Question Number'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the question number';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _questionController,
                  decoration: InputDecoration(labelText: 'Question'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the question';
                    }
                    return null;
                  },
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: _optionControllers.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _optionControllers[index],
                            decoration: InputDecoration(labelText: 'Option'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter an option';
                              }
                              return null;
                            },
                          ),
                        ),
                        IconButton(
                          onPressed: () => _removeOption(index),
                          icon: Icon(Icons.delete),
                        ),
                      ],
                    );
                  },
                ),
                ElevatedButton(
                  onPressed: _addOption,
                  child: Text('Add Option'),
                ),
                TextFormField(
                  controller: _answerController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Answer (Option Index)'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the answer';
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

