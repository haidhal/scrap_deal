// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:scrap_deal/utils/color_constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrap_deal/view/pages/onBoardingView/onBoardingTwo.dart';

class Onboardingone extends StatelessWidget {
  const Onboardingone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstants.onBoardOne,
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
                        "Accurate Weight",
                        style: GoogleFonts.pacifico(
                            textStyle: TextStyle(
                                fontSize: 28, color: ColorConstants.mainbalck)),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Image.asset(
                        "asset/scrap_images/onboard 1.png",
                        height: 200,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        "We weigh it right, pay you on the spot!\nAccurate. Transparent. Instant.\nGet cash in hand — no waiting, no worries.",
                        overflow: TextOverflow.fade,
                        maxLines: 3,
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
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Onboardingtwo(),
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
                                    color: ColorConstants.white, fontSize: 18)),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
