import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrap_deal/controller/addresscontroller.dart';
import 'package:scrap_deal/utils/color_constants.dart';
import 'package:scrap_deal/view/pages/add_details_screen/add_details_screen.dart';
import 'package:scrap_deal/view/pages/pickup_detail_screen/widget/card_address.dart';

class PickUpDetailScreen extends StatefulWidget {
  PickUpDetailScreen({super.key, this.isEdit = false});
  bool isEdit;
  @override
  State<PickUpDetailScreen> createState() => _PickUpDetailScreenState();
}

class _PickUpDetailScreenState extends State<PickUpDetailScreen> {
  @override
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
                widget.isEdit == false;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddDetailsScreen(),
                  ),
                );
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
                } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                  return Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 15,
                      ),
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        String docId = snapshot.data!.docs[index].id;
                        return CardAddress(
                            onEdit: () {
                              var addressData =
                                  snapshot.data!.docs[index].data();
                              widget.isEdit = true;
                              // String docId = snapshot.data!.docs[index].id;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AddDetailsScreen(
                                      isEditMode: true,
                                      id: docId,
                                      address:
                                          addressData['address'].toString(),
                                      addressType:
                                          addressData["addressType"].toString(),
                                      floorNo:
                                          addressData["floorNumber"].toString(),
                                      landmark:
                                          addressData["landmark"].toString(),
                                      society:
                                          addressData["societyName"].toString(),
                                    ),
                                  ));
                            },
                            onDelete: () {
                              context
                                  .read<Hivecontroller>()
                                  .deleteAddress(docId);
                              log("delete func called");
                            },
                            address:
                                snapshot.data!.docs[index].data()["address"] ??
                                    "",
                            floor: snapshot.data!.docs[index]
                                    .data()["floorNumber"] ??
                                "",
                            societyName: snapshot.data!.docs[index]
                                    .data()["societyName"] ??
                                "",
                            landMark:
                                snapshot.data!.docs[index].data()["landmark"] ??
                                    "",
                            addressType: snapshot.data!.docs[index]
                                .data()["addressType"]);
                      },
                    ),
                  );
                } else {
                  return const Center(
                    child: Text("No addresses available"),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
