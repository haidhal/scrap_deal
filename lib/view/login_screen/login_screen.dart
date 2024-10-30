// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:scrap_deal/utils/color_constants.dart';
import 'package:scrap_deal/view/home_screen/home_screen.dart';
import 'package:scrap_deal/view/registration_screen/registration_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.loginColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: ColorConstants.white,
            )),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Container(
            height: 250,
            decoration: BoxDecoration(
                color: ColorConstants.loginColor,
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(100))),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "welcome ",
                    style: TextStyle(color: ColorConstants.white, fontSize: 35),
                  ),
                  Text(
                    "      back ",
                    style: TextStyle(color: ColorConstants.white, fontSize: 35),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          //  TextFormField(
          //   decoration: InputDecoration(
          //     contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          //     hintText: "Your Email Address",
          //     hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 16, fontWeight: FontWeight.normal),
          //     enabledBorder: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(10),
          //         borderSide: BorderSide(
          //           color: Colors.grey.shade400,
          //         )),
          //     focusedBorder: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(10),
          //         borderSide: BorderSide(
          //           color: Color(0xff1a75d2),
          //         )),
          //     errorBorder: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(10),
          //         borderSide: BorderSide(
          //           color: Colors.red.shade400,
          //         )),
          //   ),
          // ),
          // SizedBox(height: 20),
          // // password input field
          // TextFormField(
          //   obscureText: true,
          //   decoration: InputDecoration(
          //       contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          //       hintText: "Your Password",
          //       hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 16, fontWeight: FontWeight.normal),
          //       enabledBorder: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(10),
          //           borderSide: BorderSide(
          //             color: Colors.grey.shade400,
          //           )),
          //       focusedBorder: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(10),
          //           borderSide: BorderSide(
          //             color: Color(0xff1a75d2),
          //           )),
          //       errorBorder: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(10),
          //           borderSide: BorderSide(
          //             color: Colors.red.shade400,
          //           )),
          //       suffixIcon: Icon(
          //         Icons.visibility_off_rounded,
          //         color: Colors.grey,
          //       )),
          // ),

          // email
          TextFormField(
            decoration: InputDecoration(
                hintText: "enter email",
                hintStyle: TextStyle(color: ColorConstants.grey, fontSize: 16),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 196, 184, 76)))),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
                hintText: "enter password",
                hintStyle: TextStyle(color: ColorConstants.grey, fontSize: 16),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 196, 184, 76)))),
          ),

          InkWell(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
            child: Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 29, 122, 199),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  "Sign In",
                  style: TextStyle(color: ColorConstants.white, fontSize: 20),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RegistrationScreen()));
              },
              child: Text(
                "create an account!sign Up",
                style: TextStyle(color: ColorConstants.mainbalck),
              )),
          Spacer()
        ],
      ),
    );
  }
}

// email
//  TextFormField(
//   decoration: InputDecoration(
//       hintText: "enter email",
//       hintStyle:
//           TextStyle(color: ColorConstants.hinttext, fontSize: 16),
//       enabledBorder:
//           OutlineInputBorder(borderSide: BorderSide.none),
//       focusedBorder: OutlineInputBorder(
//           borderSide: BorderSide(
//               color: Color.fromARGB(255, 196, 184, 76)))),
// ),
// SizedBox(
//   height: 20,
// ),
// TextFormField(
//   obscureText: true,
//   decoration: InputDecoration(
//       hintText: "enter password",
//       hintStyle:
//           TextStyle(color: ColorConstants.hinttext, fontSize: 16),
//       enabledBorder:
//           OutlineInputBorder(borderSide: BorderSide.none),
//       focusedBorder: OutlineInputBorder(
//           borderSide: BorderSide(
//               color: Color.fromARGB(255, 196, 184, 76)))),
// ),
