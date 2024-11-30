import 'package:flutter/material.dart';

class AuthController with ChangeNotifier{
 bool isObscure = true;
  void obcsureIcon(){
    isObscure = !isObscure;
  }


  
}