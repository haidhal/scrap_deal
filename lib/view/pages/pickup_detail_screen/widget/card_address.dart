// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:scrap_deal/utils/color_constants.dart';

class CardAddress extends StatelessWidget {
   CardAddress({
    super.key,
    required this.address,
    required this.floor,
    required this.societyName,
    required this.landMark,
    required this.addressType,
    required this.onDelete,
    required this.onEdit
  });
  final String address;
  final String floor;
  final String societyName;
  final String landMark;
  final String addressType;
  void Function() onDelete;
  void Function() onEdit;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      decoration: BoxDecoration(
          border: Border.all(color: ColorConstants.blue),
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.location_on_outlined,
            color: Colors.red,
          ),
          SizedBox(
            width: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                addressType,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(
                address,
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 13),
              ),
              Text(
                societyName,
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
              ),
              Row(
                children: [
                  Text(
                    "Floor number: $floor ,",
                    style:
                        TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
                  ),
                  Text(
                    "near $landMark",
                    style:
                        TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
                  ),
                ],
              )
            ],
          ),
          Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(onPressed:onDelete, icon: Icon(Icons.delete)),
              IconButton(onPressed: onEdit, icon: Icon(Icons.edit))
            ],
          )
        ],
      ),
    );
  }
}
