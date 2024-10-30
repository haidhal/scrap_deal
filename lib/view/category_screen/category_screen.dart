import 'package:flutter/material.dart';
import 'package:scrap_deal/dummy_db.dart';
import 'package:scrap_deal/utils/color_constants.dart';
import 'package:scrap_deal/view/pickup_detail_screen/pickup_detail_screen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Column(children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              children: List.generate(
            DummyDb.categoryList.length,
            (index) => Padding(
              padding: const EdgeInsets.all(10.0),
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
          )),
        ),
        const Divider(
          height: 4,
        ),
      ]),
    );
  }
}
