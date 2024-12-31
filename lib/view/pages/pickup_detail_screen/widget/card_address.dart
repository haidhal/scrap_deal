// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:scrap_deal/utils/color_constants.dart';

class CardAddress extends StatelessWidget {
 const CardAddress({
    super.key,
    required this.address,
    required this.floor,
    required this.societyName,
    required this.landMark,
    required this.addressType,
  });
 final String address;
 final String floor;
 final String societyName;
 final String landMark;
 final String addressType;
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                address,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              Text(
                societyName,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(
                floor,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(
                landMark,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(
                "Address Type : $addressType",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
              IconButton(onPressed: () {}, icon: Icon(Icons.edit))
            ],
          )
        ],
      ), 
    );
  }
}
