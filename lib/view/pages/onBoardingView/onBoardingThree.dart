import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrap_deal/utils/color_constants.dart';
import 'package:scrap_deal/view/pages/authentication_screens/login_screen/login_screen.dart';
import 'package:scrap_deal/view/pages/home_screen/home_screen.dart';

class Onboardingthree extends StatelessWidget {
  const Onboardingthree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstants.onBoardThree,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      Text(
                        "Recycle",
                        style: GoogleFonts.pacifico(
                            textStyle: TextStyle(
                                fontSize: 28, color: ColorConstants.mainbalck)),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Image.asset(
                        "asset/scrap_images/onBoard 3.png",
                        height: 200,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Join us in building a \n cleaner,\n greener, \nand better tomorrow!",
                        overflow: TextOverflow.fade,
                        maxLines: 4,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          color: ColorConstants.mainbalck,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          //height: 50,
                          width: 120,
                          decoration: BoxDecoration(
                              color: ColorConstants.mainbalck,
                              borderRadius: BorderRadius.circular(25)),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Center(
                              child: Text(
                                "Back",
                                style: GoogleFonts.lora(
                                    textStyle: TextStyle(
                                        color: ColorConstants.white,
                                        fontSize: 18)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                ////////////////
                                builder: (context) => LoginScreen(),
                              ));
                        },
                        child: Container(
                          //height: 50,
                          width: 120,
                          decoration: BoxDecoration(
                              color: ColorConstants.mainbalck,
                              borderRadius: BorderRadius.circular(25)),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Center(
                              child: Text(
                                "Next",
                                style: GoogleFonts.lora(
                                    textStyle: TextStyle(
                                        color: ColorConstants.white,
                                        fontSize: 18)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
