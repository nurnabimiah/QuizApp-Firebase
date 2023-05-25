

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import 'package:quizapp_project/screens/splash_screen.dart';

import '../auth/auth_services.dart';
import '../const_file/app_all_color.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: AppColor.appPrimaryColor,
            height: 200,
            child: Lottie.asset('images/animations/quizicon.json'),
          ),
          
          ListTile(
            onTap: () {
              AuthServices.logOutStudents()
                  .then((_) => Navigator.push(context, MaterialPageRoute(builder: (context)=>SplashScreen())));
            },
            leading: Icon(Icons.logout,color: Colors.red,),
            title: Text('Logout',style: TextStyle(fontSize: 14.sp,color:Colors.red),),
          ),
        ],
      ),
    );
  }
}


class MainDrawer2 extends StatelessWidget {
  const MainDrawer2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: AppColor.appPrimaryColor,
            height: 200,
            child: Lottie.asset('images/animations/quizicon.json'),
          ),

          ListTile(
            onTap: () {
              AuthServices.logOutTeacher()
                  .then((_) => Navigator.push(context, MaterialPageRoute(builder: (context)=>SplashScreen())));
            },
            leading: Icon(Icons.logout,color: Colors.red,),
            title: Text('Logout',style: TextStyle(fontSize: 14.sp,color:Colors.red),),
          ),
        ],
      ),
    );
  }
}


