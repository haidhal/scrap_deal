// ignore_for_file: prefer_const_constructors


import 'package:flutter/material.dart';
import 'package:scrap_deal/dummy_db.dart';
import 'package:scrap_deal/utils/color_constants.dart';
import 'package:scrap_deal/view/pages/profile_screen/profile_page.dart';
import 'package:scrap_deal/view/pages/home_screen/widget/category_card.dart';
import 'package:scrap_deal/view/pages/rate_card_screen/rate_card.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.homescreenGreen,
        title: SizedBox(
            width: 200,
            height: 150,
            child: Image.asset(
                "asset/scrap_images/Screenshot_2024-10-24_213659-removebg-preview.png")),
      ),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.push(context,
               MaterialPageRoute(builder: (context)=> RateCard()));
            },
            child: Center(
              child: Container(
                height: 70,
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: ColorConstants.homescreenGreen),
                    child: Center(
                      child: Text("Rate Card",
                      style: TextStyle(
                        color: ColorConstants.white,
                        fontSize: 24,
                       
                      ),),
                    ),
              ),
            ),
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: ColorConstants.mainbalck,
        child: ListView(
          children: [
            SizedBox(
              height: 150,
              child: DrawerHeader(
                  decoration:
                      BoxDecoration(color: ColorConstants.homescreenGreen),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Image.asset(
                          "asset/scrap_images/Screenshot_2024-10-24_213659-removebg-preview.png")
                    ],
                  )),
            ),
            Column(
              children: [
                TextButton(
                    onPressed: () {
                       Navigator.push(context,
                       MaterialPageRoute(builder: (context) => ProfilePage(),));
                    },
                    child: Row(
                      children: [
                        Text(
                          "•",
                          style: TextStyle(fontSize: 26),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "My Profile",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: ColorConstants.white),
                        )
                      ],
                    )),
                SizedBox(
                  height: 10,
                ),
                TextButton(
                    onPressed: () {
                     
                    },
                    child: Row(
                      children: [
                        Text(
                          "•",
                          style: TextStyle(fontSize: 26),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "My Notification",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: ColorConstants.white),
                        )
                      ],
                    )),
                SizedBox(
                  height: 10,
                ),
                TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Text(
                          "•",
                          style: TextStyle(fontSize: 26),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "My Orders",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: ColorConstants.white),
                        )
                      ],
                    )),
                SizedBox(
                  height: 10,
                ),
                TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.logout_rounded,
                          color: ColorConstants.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Logout",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: ColorConstants.white),
                        )
                      ],
                    ))
              ],
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15, left: 20, bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sell your recyclables",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 25,
                  fontWeight: FontWeight.w800),
            ),
            Text(
              "     online with Scrap Depot!",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 25,
                  fontWeight: FontWeight.w800),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) => CategoryCard(
                        image: DummyDb.categoryList[index]["image"],
                        category: DummyDb.categoryList[index]["category"],
                      ),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 25,
                      ),
                  itemCount: DummyDb.categoryList.length),
            )
          ],
        ),
      ),
    );
  }
}
