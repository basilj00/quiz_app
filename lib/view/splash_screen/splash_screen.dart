import 'package:flutter/material.dart';
import 'package:quiz_app/view/home_screen/home_screen.dart';
import 'package:quiz_app/view/utils/image_consants/image_consants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

 @override
  void initState() {
    Future.delayed(Duration(seconds: 1)).then(
      (value){
    Navigator.pushReplacement(context,
    MaterialPageRoute(builder: (context) => HomeScreen(),
    )
        );
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      
      body: Center(
         child: Image.asset(ImageConsants.LOGO)
        
      ),
    );
  }
}