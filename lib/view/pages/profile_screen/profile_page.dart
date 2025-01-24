// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrap_deal/controller/profile_controller.dart';
import 'package:scrap_deal/utils/color_constants.dart';
import 'package:scrap_deal/view/pages/authentication_screens/login_screen/login_screen.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await context.read<ProfileController>().getUserDetails();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final profileData = context.watch<ProfileController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.homescreenGreen,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Edit",
                        style: TextStyle(color: Colors.blue, fontSize: 15),
                      ))
                ],
              ),
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.black,
                child: Icon(
                  Icons.person,
                  color: ColorConstants.white,
                  size: 80,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              profileData.userData != null
                  ? Column(
                      children: [
                        Text(
                          profileData.userData!['name'] ?? "No name",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(profileData.userData!['email'] ?? "",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.normal))
                      ],
                    )
                  : CircularProgressIndicator(),
              Spacer(),
              TextButton(
                onPressed: () async {
                  try {
                    await FirebaseAuth.instance.signOut();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                      (route) => false,
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(e.toString()),
                      ),
                    );
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.logout,
                      color: Colors.blue,
                    ),
                    Text(
                      "Logout",
                      style: TextStyle(color: Colors.blue),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
