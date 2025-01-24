import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileController extends ChangeNotifier {
  Map<String, dynamic>? userData;
  Future<void> getUserDetails() async {
    try {
      var res = await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      var data = res.data();
      log('hhshshsh ${data!['email']}');
      userData = data;
    } catch (e) {
      log(e.toString());
    }
  }
}
