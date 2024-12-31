import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scrap_deal/utils/color_constants.dart';
import 'package:scrap_deal/view/pages/home_screen/home_screen.dart';
import 'package:scrap_deal/view/pages/authentication_screens/login_screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    splashFunc();
    super.initState();
  }

  splashFunc() async {
    await Future.delayed(const Duration(seconds: 3)).then((value) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const HomeScreen();
              } else {
                return LoginScreen();
              }
            },
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstants.mainbalck,
        body: Container(
          decoration: BoxDecoration(color: ColorConstants.mainbalck),
          child: Center(
              child: Image.asset(
                  "asset/scrap_images/Screenshot 2024-10-21 224639.png")),
        ));
  }
}
