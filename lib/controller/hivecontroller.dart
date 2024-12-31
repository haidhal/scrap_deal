import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:scrap_deal/model/hive_model.dart';
import 'package:scrap_deal/utils/app_utils.dart';

class Hivecontroller with ChangeNotifier {
  List<dynamic> addressList = [];
  final addressBox = Hive.box(AppUtils.addressBox);
  void addAddress(AddressModel addressData) {
    addressBox.add(AddressModel(
        address: addressData.address,
        floorName: addressData.floorName,
        landMark: addressData.landMark,
        societyName: addressData.societyName,
        addressType: addressData.addressType));
  }

  void getAddress() {
    addressList = addressBox.values.toList();
    notifyListeners();
  }

//   Future<void> deleteAddress(int index) async {
//  await addressList = addressBox.delete(index);
//   }
}
