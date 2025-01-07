import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scrap_deal/model/hive_model.dart';

class Hivecontroller with ChangeNotifier {
 // List<dynamic> addressList = [];
  AddressModel? addressdata ;
 // final addressBox = Hive.box(AppUtils.addressBox);
  // add address to firebase
  Future<void> addAddress(AddressModel addressData) async {
  await FirebaseFirestore.instance.collection("address").add({
    "floorNumber" :addressData.floorName,
    "landmark" : addressData.landMark,
    "societyName" : addressData.societyName,
    "address" : addressData.address,
    "addressType" : addressData.addressType
   });
   log("address added to firebase");
  }

  // void getAddress() {
  //   addressList = addressBox.values.toList();
  //   notifyListeners();
  // }


}
