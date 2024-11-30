// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:scrap_deal/dummy_db.dart';
import 'package:scrap_deal/utils/color_constants.dart';
import 'package:scrap_deal/view/pickup_detail_screen/pickup_detail_screen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> allItems = [];
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: EdgeInsets.all(15),
                height: 70,
                // width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: ColorConstants.homescreenGreen),
                child: Center(
                  child: Text(
                    "Selected(0)",
                    style: TextStyle(
                      color: ColorConstants.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  // date picker
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PickUpDetailScreen()));
                },
                child: Container(
                  padding: EdgeInsets.all(15),
                  height: 70,
                  // width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ColorConstants.homescreenGreen),
                  child: Center(
                    child: Text(
                      "Proceed",
                      style: TextStyle(
                        color: ColorConstants.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: List.generate(
              DummyDb.categoryList.length,
              (index) => Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                    backgroundColor: ColorConstants.mainbalck,
                    radius: 80,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.asset(
                        DummyDb.categoryList[index]["image"],
                      ),
                    ),
                  ),
                ),
              ),
            )),
          ),
          const Divider(
            height: 4,
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, mainAxisSpacing: 15, crossAxisSpacing: 25),
              itemBuilder: (context, index) => Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.pink.shade100),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.check_circle_outlined,
                      color: Colors.grey,
                    ),
                    Column(
                      children: [
                        Text(
                          // DummyDb.categoryDetails[0].forEach((category, items) {
                          //   allItems.addAll(items); // Flatten the items list
                          // }),
                            DummyDb.categoryDetails[0][index]["itemName"],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "itemPrice",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
