// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrap_deal/bloc/auth_bloc/bloc/auth_bloc.dart';
import 'package:scrap_deal/utils/color_constants.dart';
import 'package:scrap_deal/view/home_screen/home_screen.dart';
import 'package:scrap_deal/view/registration_screen/registration_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController loginemailController = TextEditingController();

  final TextEditingController loginpassController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.mainbalck,
      appBar: AppBar(
        backgroundColor: ColorConstants.loginColor,
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: ColorConstants.loginColor,
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(100))),
                    child: Image.asset(
                        "asset/scrap_images/Screenshot_2024-10-24_213659-removebg-preview.png")),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        "Login Here!",
                        style:
                            TextStyle(fontSize: 20, color: ColorConstants.white),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      // email
                      TextFormField(
                        controller: loginemailController,
                        style: TextStyle(color: ColorConstants.white),
                        decoration: InputDecoration(
                            labelText: "Email",
                            labelStyle: TextStyle(color: ColorConstants.grey),
                            enabledBorder:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 196, 184, 76)))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter an email";
                          }
                          if (!RegExp(
                                  r"^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$")
                              .hasMatch(value)) {
                            return "Enter a valid email";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: loginpassController,
                        style: TextStyle(color: ColorConstants.white),
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: "Password",
                            labelStyle: TextStyle(color: ColorConstants.grey),
                            enabledBorder:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.brown))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "enter password";
                          }
                          if (value.length < 6) {
                            return "password must contain atleast 6 characters";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
            
                      BlocListener<AuthBloc, AuthState>(
                        listener: (context, state) {
                          if (state is AuthSuccessState) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Login Successsfull")));
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(),
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
                              return CircularProgressIndicator();
                            }
                            return InkWell(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<AuthBloc>().add(OnLoginEvent(
                                      loginEmail: loginemailController.text,
                                      loginPass: loginpassController.text));
                                  //   Navigator.pushReplacement(context,
                                  //    MaterialPageRoute(builder: (context)=>HomeScreen()));
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
                                    "Sign In",
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
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "create an account!",
                            style: TextStyle(color: ColorConstants.white),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RegistrationScreen()));
                              },
                              child: Text(
                                "sign Up",
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
    );
  }
}
