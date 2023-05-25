




import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quizapp_project/model_class/quiz_model_class.dart';
import 'package:quizapp_project/provider/quiz_provider.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quizapp_project/screens/subject_wise_list/bangla_quiz_list.dart';
import 'package:quizapp_project/screens/teacher_screen/quiz_list_teacher.dart';

class CreateQuizpage extends StatefulWidget {
  const CreateQuizpage({Key? key}) : super(key: key);

  @override
  State<CreateQuizpage> createState() => _CreateQuizpageState();
}


class _CreateQuizpageState extends State<CreateQuizpage> {
  final _formKey = GlobalKey<FormState>();
  String? _subjects;
  String? _selectedSubject;
  bool _isInit = true;
  QuizModel quizModel = QuizModel();
  late QuizProvider _quizProvider;
  List<String> _options = [];

  @override
  void didChangeDependencies() {
    if (_isInit) {
      _quizProvider = Provider.of<QuizProvider>(context, listen: false);
      _quizProvider.init().then((value) {
        _isInit = false;
      });
    }

    super.didChangeDependencies();
  }

  void submitQuiz() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Save the data to Firestore
      FirebaseFirestore.instance.collection('Question').add({
        'questionNumber': quizModel.questionNumber,
        'subjects': quizModel.subjects,
        'question': quizModel.question,
        'options': _options,
        'answer': quizModel.answer,
      });

      // Reset the form and options list
      _formKey.currentState!.reset();
      _options.clear();

      // Show a success message or navigate to another page
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Quiz submitted successfully')),
      );

      // Navigate to the desired page after submission
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TeacherQuizListScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Quiz'),
        actions: [
          TextButton(
            onPressed: submitQuiz,
            child: Text('Submit', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 32.0, left: 12.0, right: 12.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // question number
                TextFormField(
                  style: TextStyle(color: Colors.black),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field must not be empty';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    quizModel.questionNumber = int.tryParse(value!);
                  },
                  decoration: InputDecoration(
                    labelText: 'Question Number',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10.0),

                TextFormField(
                  maxLines: 3,
                  style: TextStyle(color: Colors.black),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field must not be empty';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    quizModel.question = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'Question',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10.0),
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: _options.length,
                  separatorBuilder: (context, index) => SizedBox(height: 10.0),
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            style: TextStyle(color: Colors.black),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'This field must not be empty';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _options[index] = value!;
                            },
                            decoration: InputDecoration(
                              labelText: 'Option ${index + 1}',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _options.removeAt(index);
                            });
                          },
                          icon: Icon(Icons.delete),
                        ),
                      ],
                    );
                  },
                ),
                SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _options.add('');
                    });
                  },
                  child: Text('Add Option'),
                ),

                SizedBox(height: 10.0),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  hint: Text('Select subject'),
                  value: _selectedSubject,
                  onChanged: (value) {
                    setState(() {
                      _selectedSubject = value;
                    });
                  },
                  onSaved: (_) {
                    quizModel.subjects = _selectedSubject;
                  },
                  items: _quizProvider.subjectList.map((cat) {
                    return DropdownMenuItem(
                      child: Text(
                        cat,
                        style: TextStyle(color: Colors.black),
                      ),
                      value: cat,
                    );
                  }).toList(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a Subject';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: Colors.black),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field must not be empty';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    quizModel.answer = int.tryParse(value!);
                  },
                  decoration: InputDecoration(
                    labelText: 'Question Answer',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}







