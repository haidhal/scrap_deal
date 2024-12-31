import 'package:flutter/material.dart';
import 'package:scrap_deal/utils/color_constants.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.homescreenGreen,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
            ),
            CircleAvatar(
              radius: 80,
              backgroundColor: Colors.black,
              child: Icon(
                Icons.person,
                color: ColorConstants.white,
                size: 100,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "HAIDHAL BABU",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
