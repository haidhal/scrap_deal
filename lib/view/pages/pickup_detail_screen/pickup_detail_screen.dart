import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrap_deal/controller/hivecontroller.dart';
import 'package:scrap_deal/model/hive_model.dart';
import 'package:scrap_deal/utils/color_constants.dart';
import 'package:scrap_deal/view/pages/add_details_screen/add_details_screen.dart';
import 'package:scrap_deal/view/pages/pickup_detail_screen/widget/card_address.dart';

class PickUpDetailScreen extends StatefulWidget {
  const PickUpDetailScreen({super.key});

  @override
  State<PickUpDetailScreen> createState() => _PickUpDetailScreenState();
}

class _PickUpDetailScreenState extends State<PickUpDetailScreen> {
  @override
  // void initState() {
  //   WidgetsBinding.instance.addPostFrameCallback(
  //     (timeStamp) {
  //       context.read<Hivecontroller>().getAddress();
  //     },
  //   );
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final pickUpProvider = context.watch<Hivecontroller>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.blue,
        title: Text(
          "Pick Up Details",
          style: TextStyle(
            color: ColorConstants.white,
            fontSize: 22,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddDetailsScreen(),
                    
                  ),

                );
                log("!!!!!!!!!!!");
              },
              child: Container(
                color: ColorConstants.blue,
                height: 50,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: ColorConstants.white,
                    ),
                    Text(
                      "Add New Address",
                      style:
                          TextStyle(color: ColorConstants.white, fontSize: 18),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection("address").snapshots(),
              builder: (context, snapshot) {
               
                if (snapshot.connectionState == ConnectionState.waiting) {
                 
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasData) {
                  return Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        snapshot.data!.docs.map((e) => CardAddress(
                            address: e[pickUpProvider.addressdata!.address!],
                            floor:
                                e[pickUpProvider.addressdata!.floorName!] ?? "",
                            societyName:
                                e[pickUpProvider.addressdata!.societyName!],
                            landMark:
                                e[pickUpProvider.addressdata!.landMark!] ?? "",
                            addressType:
                                e[pickUpProvider.addressdata!.addressType!]));
                        return const SizedBox();
                      },
                    ),
                  );
                } else {
                  return SizedBox();
                }
              },
            )
            // Expanded(
            //   child: ListView.separated(
            //       itemBuilder: (context, index) => CardAddress(
            //             address: pickUpProvider.addressList[index].address
            //                 .toString(),
            //             addressType: pickUpProvider
            //                 .addressList[index].addressType
            //                 .toString(),
            //             floor: pickUpProvider.addressList[index].floorName
            //                 .toString(),
            //             landMark: pickUpProvider.addressList[index].landMark
            //                 .toString(),
            //             societyName: pickUpProvider
            //                 .addressList[index].societyName
            //                 .toString(),
            //           ),
            //       separatorBuilder: (context, index) => const SizedBox(
            //             height: 15,
            //           ),
            //       itemCount: pickUpProvider.addressList.length),
            // ),
          ],
        ),
      ),
    );
  }
}
