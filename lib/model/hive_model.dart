import 'package:hive_flutter/hive_flutter.dart';

part 'hive_model.g.dart';
// Add this line

@HiveType(typeId: 0) // Ensure typeId is unique
class AddressModel {
  @HiveField(0)
  String? societyName;

  @HiveField(1)
  String? address;

  @HiveField(2)
  String? floorName;

  @HiveField(3)
  String? landMark;

 @HiveField(4)
  String? addressType;

  AddressModel({
    this.address,
    this.societyName,
    this.floorName,
    this.landMark,
    this.addressType
  });
}
