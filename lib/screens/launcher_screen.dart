


import 'package:flutter/material.dart';
import 'package:quizapp_project/screens/decision_making_screen.dart';
import 'package:quizapp_project/screens/student_screen/student_quiz_list_screen.dart';

import '../auth/auth_services.dart';


class LauncherPage extends StatefulWidget {

  @override
  _LauncherPageState createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      if(AuthServices.currentUser == null ) {
       Navigator.push(context, MaterialPageRoute(builder: (context)=>DecisionMakingScreen()));
      }else {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentQuizListScreen()));
      }
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}