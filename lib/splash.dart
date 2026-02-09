import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:student_directory_app/studententry.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5),() {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Studententry(),),);
    },);
    return Scaffold(
      body: Center(child: Lottie.asset("assets/Splash.json"),),
    );
  }
}