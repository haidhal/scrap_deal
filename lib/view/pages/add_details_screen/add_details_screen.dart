// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrap_deal/controller/addresscontroller.dart';
import 'package:scrap_deal/model/hive_model.dart';
import 'package:scrap_deal/utils/color_constants.dart';

class AddDetailsScreen extends StatefulWidget {
  AddDetailsScreen(
      {super.key,
      this.isEditMode = false,
      this.id,
      this.address,
      this.addressType,
      this.floorNo,
      this.landmark,
      this.society});
  final bool isEditMode;

  final String? id;
  String? address;
  String? addressType;
  String? landmark;
  String? society;
  String? floorNo;

  @override
  State<AddDetailsScreen> createState() => _AddDetailsScreenState();
}

class _AddDetailsScreenState extends State<AddDetailsScreen> {
  String radioGrpvalue = "";
  TextEditingController societycontroler = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController floorcontroller = TextEditingController();
  TextEditingController landMarkcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    if (widget.isEditMode == true) {
      societycontroler.text = widget.society!;
      addresscontroller.text = widget.address!;
      floorcontroller.text = widget.floorNo!;
      landMarkcontroller.text = widget.landmark!;
      radioGrpvalue = widget.addressType!;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.blue,
        title: widget.isEditMode == true
            ? Text(
                "Edit Address Details",
                style: TextStyle(color: ColorConstants.white),
              )
            : Text(
                "Enter Address Details",
                style: TextStyle(color: ColorConstants.white),
              ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Select Address Type",
                  style: TextStyle(
                      color: ColorConstants.blue,
                      fontSize: 22,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 150,
                  child: Column(
                    children: [
                      RadioListTile(
                        title: const Text(
                          "Home",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        value: "Home",
                        groupValue: radioGrpvalue,
                        onChanged: (value) {
                          setState(() {
                            radioGrpvalue = value!;
                          });
                        },
                      ),
                      RadioListTile(
                        title: const Text(
                          "Office",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        value: "Office",
                        groupValue: radioGrpvalue,
                        onChanged: (value) {
                          setState(() {
                            radioGrpvalue = value!;
                          });
                        },
                      ),
                      RadioListTile(
                        title: const Text(
                          "Others",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        value: "Others",
                        groupValue: radioGrpvalue,
                        onChanged: (value) {
                          setState(() {
                            radioGrpvalue = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Enter Full Address",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: ColorConstants.blue),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: addresscontroller,
                  decoration: InputDecoration(
                      focusColor: ColorConstants.grey,
                      hintText: "Enter Address",
                      hintStyle: TextStyle(color: ColorConstants.grey)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "enter your address";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: floorcontroller,
                  decoration: InputDecoration(
                      hintText: "Floor(Optional)",
                      hintStyle: TextStyle(color: ColorConstants.grey)),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: societycontroler,
                  decoration: InputDecoration(
                      focusColor: Colors.grey,
                      hintText: "Enter Society Name",
                      hintStyle: TextStyle(color: ColorConstants.grey)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "enter your Society Name";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: landMarkcontroller,
                  decoration: InputDecoration(
                      hintText: "Nearby Landmark(Optional)",
                      hintStyle: TextStyle(color: ColorConstants.grey)),
                ),
                SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Material(
                    elevation: 10,
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          widget.isEditMode == true
                              ? context.read<Hivecontroller>().editAddress(
                                  address: addresscontroller.text,
                                  addressType: radioGrpvalue,
                                  docId: widget.id!,
                                  floorNo: floorcontroller.text,
                                  landMark: landMarkcontroller.text,
                                  societyName: societycontroler.text)
                              : context.read<Hivecontroller>().addAddress(
                                  AddressModel(
                                      address: addresscontroller.text,
                                      floorName: floorcontroller.text,
                                      landMark: societycontroler.text,
                                      societyName: societycontroler.text,
                                      addressType: radioGrpvalue));
                          log("address added successfully");
                          Navigator.pop(context);
                        }
                      },
                      child: Container(
                        height: 60,
                        width: 200,
                        decoration: BoxDecoration(
                            color: ColorConstants.blue,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Text(
                            widget.isEditMode == true ? "UPDATE" : "SUBMIT",
                            style: TextStyle(
                                color: ColorConstants.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 18),
                          ),
                        ),
                      ),
                    ),
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
