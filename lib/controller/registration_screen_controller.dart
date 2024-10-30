import 'package:flutter/material.dart';

class RegistrationScreenController with ChangeNotifier{
 bool isObscure = true;
  void obcsureIcon(){
    isObscure = !isObscure;
  }
}