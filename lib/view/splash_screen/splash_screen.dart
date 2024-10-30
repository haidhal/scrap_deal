import 'package:flutter/material.dart';
import 'package:scrap_deal/utils/color_constants.dart';
import 'package:scrap_deal/view/login_screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then((value) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.mainbalck,
      body: 
      Container(
        
        decoration: BoxDecoration(
          color: ColorConstants.mainbalck
         
        ),
        child:  
         Center(child: Image.asset("asset/scrap_images/Screenshot 2024-10-21 224639.png")),
      )
      
    );
  }
}


