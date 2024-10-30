// ignore_for_file: prefer_const_constructors

//import 'dart:math';

import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
//import 'package:scrap_deal/controller/registration_screen_controller.dart';
import 'package:scrap_deal/utils/color_constants.dart';
import 'package:scrap_deal/view/home_screen/home_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  TextEditingController confirmpasscontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    //final providerObj = context.read<RegistrationScreenController>();
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
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SizedBox(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 250,
                    decoration: BoxDecoration(
                        color: ColorConstants.loginColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(100))),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Create ",
                            style: TextStyle(
                                color: ColorConstants.white, fontSize: 35),
                          ),
                          Text(
                            "      Account ",
                            style: TextStyle(
                                color: ColorConstants.white, fontSize: 35),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Name",
                        hintStyle:
                            TextStyle(color: ColorConstants.grey, fontSize: 16),
                        enabledBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 196, 184, 76)))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // TextFormField(
                  //   controller: emailcontroller,
                  //   decoration: InputDecoration(
                  //     contentPadding:
                  //         EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  //     hintText: "Your Email Address",
                  //     hintStyle: TextStyle(
                  //         color: Colors.grey.shade500,
                  //         fontSize: 16,
                  //         fontWeight: FontWeight.normal),
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
                  //   validator: (value) {
                  //     if (value != null && value.contains("@")) {
                  //       return null;
                  //     } else {
                  //       return " enter a valid email ";
                  //     }
                  //   },
                  // ),
                  // SizedBox(height: 20),
                  // TextFormField(
                  //   controller: passcontroller,
                  //   obscureText: isObscure,
                  //   decoration: InputDecoration(
                  //       contentPadding:
                  //           EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  //       hintText: "Your Password",
                  //       hintStyle: TextStyle(
                  //           color: Colors.grey.shade500,
                  //           fontSize: 16,
                  //           fontWeight: FontWeight.normal),
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
                  //       suffixIcon: InkWell(
                  //         onTap: () {
                  //           setState(() {
                  //             isObscure = !isObscure;
                  //           });
                  //         },
                  //         child: Icon(
                  //           isObscure
                  //               ? Icons.visibility_off_rounded
                  //               : Icons.visibility,
                  //           color: Colors.grey,
                  //         ),
                  //       )),
                  //   validator: (value) {
                  //     if (value != null && value.length <= 6) {
                  //       return null;
                  //     } else {
                  //       return "enter password";
                  //     }
                  //   },
                  // ),
                  // SizedBox(height: 20),
                  // TextFormField(
                  //   controller: confirmpasscontroller,
                  //   decoration: InputDecoration(
                  //       contentPadding:
                  //           EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  //       hintText: "Confirm Your Password",
                  //       hintStyle: TextStyle(
                  //           color: Colors.grey.shade500,
                  //           fontSize: 16,
                  //           fontWeight: FontWeight.normal),
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
                  //   validator: (value) {
                  //     if (value == passcontroller.text.trim()) {
                  //       return null;
                  //     } else {
                  //       return "password doesn't match";
                  //     }
                  //   },
                  // ),

                  //  Email
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "enter email",
                        hintStyle:
                            TextStyle(color: ColorConstants.grey, fontSize: 16),
                        enabledBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 196, 184, 76)))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Password
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.visibility_off_rounded,
                          ),
                          color: Colors.grey,
                        ),
                        hintText: "enter password",
                        hintStyle:
                            TextStyle(color: ColorConstants.grey, fontSize: 16),
                        enabledBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 196, 184, 76)))),
                  ),

                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    },
                    child: Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 29, 122, 199),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                color: ColorConstants.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//  Email
//     TextFormField(
//       decoration: InputDecoration(
//           hintText: "enter email",
//           hintStyle:
//               TextStyle(color: ColorConstants.hinttext, fontSize: 16),
//           enabledBorder:
//               OutlineInputBorder(borderSide: BorderSide.none),
//           focusedBorder: OutlineInputBorder(
//               borderSide: BorderSide(
//                   color: Color.fromARGB(255, 196, 184, 76)))),
//     ),
//     SizedBox(
//       height: 20,
//     ),
// // Password
//     TextFormField(
//       obscureText: true,
//       decoration: InputDecoration(
//         suffixIcon: IconButton(onPressed: (){
//           providerObj.obcsureIcon();
//         },
//         icon:Icon(Icons.visibility_off_rounded, ),

//         color: Colors.grey,),
//           hintText: "enter password",
//           hintStyle:
//               TextStyle(color: ColorConstants.hinttext, fontSize: 16),
//           enabledBorder:
//               OutlineInputBorder(borderSide: BorderSide.none),
//           focusedBorder: OutlineInputBorder(
//               borderSide: BorderSide(
//                   color: Color.fromARGB(255, 196, 184, 76)))),
//     ),
