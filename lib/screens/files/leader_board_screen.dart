
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LeaderboardScreen extends StatelessWidget {
  final int userPoints;

  LeaderboardScreen({required this.userPoints});


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          title: Text('Leaderboard'),
        ),
        body: Center(
          child: Text(
            'Your Points: $userPoints',
            style: TextStyle(fontSize: 24.sp,color: Colors.red),
          ),
        ),
      ),
    );
  }
}
