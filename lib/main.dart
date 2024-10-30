import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:scrap_deal/controller/registration_screen_controller.dart';
//import 'package:scrap_deal/view/home_screen/home_screen.dart';
//import 'package:scrap_deal/view/login_screen/login_screen.dart';
import 'package:scrap_deal/view/splash_screen/splash_screen.dart';
//import 'package:scrap_deal/view/registration_screen/registration_screen.dart';

void main (){
runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return
       const MaterialApp(
        debugShowCheckedModeBanner: false,
          home: SplashScreen(),
      );   
  }
}