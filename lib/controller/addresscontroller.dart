import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scrap_deal/model/hive_model.dart';

class Hivecontroller with ChangeNotifier {
  List<AddressModel> addressList = [];

  Future<void> addAddress(AddressModel addressData) async {
    await FirebaseFirestore.instance
        .collection("address")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({
      "floorNumber": addressData.floorName,
      "landmark": addressData.landMark,
      "societyName": addressData.societyName,
      "address": addressData.address,
      "addressType": addressData.addressType
    });
    log("address added to firebase");
  }

  Future<void> deleteAddress(String id) async {
    await FirebaseFirestore.instance.collection("address").doc(id).delete();
    notifyListeners();
    log("address deleted");
  }

  void editAddress(
      {required String floorNo,
      required String address,
      required String landMark,
      required String societyName,
      required String addressType,
      required String docId}) {
    FirebaseFirestore.instance.collection("address").doc(docId).update({
      "floorNumber": floorNo,
      "landmark": landMark,
      "societyName": societyName,
      "address": address,
      "addressType": addressType
    });
  }
}
