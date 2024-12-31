import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrap_deal/bloc/auth_bloc/bloc/auth_bloc.dart';

import 'package:scrap_deal/utils/color_constants.dart';
import 'package:scrap_deal/view/pages/authentication_screens/login_screen/login_screen.dart';

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
    return Scaffold(
      backgroundColor: ColorConstants.mainbalck,
      appBar: AppBar(
        backgroundColor: ColorConstants.loginColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SizedBox(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      height: 200,
                      decoration: BoxDecoration(
                          color: ColorConstants.loginColor,
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(100))),
                      child: Image.asset(
                          "asset/scrap_images/Screenshot_2024-10-24_213659-removebg-preview.png")),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          "SignUp Here!",
                          style: TextStyle(
                              fontSize: 20, color: ColorConstants.white),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: namecontroller,
                          style: TextStyle(color: ColorConstants.white),
                          decoration: InputDecoration(
                              labelText: "Name",
                              labelStyle: TextStyle(color: ColorConstants.grey),
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 196, 184, 76)))),
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        //  Email
                        TextFormField(
                          controller: emailcontroller,
                          style: TextStyle(color: ColorConstants.white),
                          decoration: InputDecoration(
                              labelText: "Email",
                              labelStyle: TextStyle(color: ColorConstants.grey),
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 196, 184, 76)))),
                          validator: (value) {
                            if (value == null && value!.isEmpty) {
                              return " enter  email";
                            }
                            if (!value.contains("@")) {
                              return "enter a valid email";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // Password
                        TextFormField(
                          controller: passcontroller,
                          obscureText: true,
                          style: TextStyle(color: ColorConstants.white),
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.visibility_off_rounded,
                                ),
                                color: Colors.grey,
                              ),
                              labelText: "Password",
                              labelStyle: TextStyle(color: ColorConstants.grey),
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 196, 184, 76)))),
                          validator: (value) {
                            if (value == null && value!.isEmpty) {
                              return "enter password";
                            }
                            if (value.length < 6) {
                              return "password must contain 6 characters";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        BlocListener<AuthBloc, AuthState>(
                          listener: (context, state) {
                            if (state is AuthSuccessState) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("Registration success")));
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginScreen(),
                                  ));

                            
                            }
                            if (state is AuthErrorState) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(state.errorMessage)));
                            }
                          },
                          child: BlocBuilder<AuthBloc, AuthState>(
                            builder: (context, state) {
                              if (state is AuthLoadingState) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                              return InkWell(
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    log("uvsys");
                                    context.read<AuthBloc>().add(
                                          OnRegistrationEvent(
                                            email: emailcontroller.text,
                                            password: passcontroller.text,
                                            name: namecontroller.text,
                                          ),
                                        );
                                       
                                  }
                                },
                                child: Container(
                                  height: 50,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: ColorConstants.loginColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: Text(
                                      "Sign Up",
                                      style: TextStyle(
                                          color: ColorConstants.white,
                                          fontSize: 20),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account!",
                              style: TextStyle(color: ColorConstants.white),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginScreen()));
                                },
                                child: Text(
                                  "sign In",
                                  style: TextStyle(color: ColorConstants.white),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
