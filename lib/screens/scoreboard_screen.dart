
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../const_file/app_textstyle.dart';


class ScoreboardScreen extends StatelessWidget {
  final int score;

  ScoreboardScreen({required this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Your result is: $score',style: quizHeaderTextStyle(18.sp),),
      ),
    );
  }
}
