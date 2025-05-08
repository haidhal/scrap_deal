// // ignore_for_file: prefer_const_constructors

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:scrap_deal/utils/color_constants.dart';
// import 'package:scrap_deal/view/pages/authentication_screens/login_screen/login_screen.dart';
// import 'package:scrap_deal/view/pages/profile_screen/profile_page.dart';

// class Drawer extends StatelessWidget {
//   const Drawer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//         backgroundColor: ColorConstants.mainbalck,
//         child: ListView(
//           children: [
//             SizedBox(
//               height: 150,
//               child: DrawerHeader(
//                   decoration:
//                       BoxDecoration(color: ColorConstants.homescreenGreen),
//                   child: Column(
//                     children: [
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Image.asset(
//                           "asset/scrap_images/Screenshot_2024-10-24_213659-removebg-preview.png")
//                     ],
//                   )),
//             ),
//             Column(
//               children: [
//                 TextButton(
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => ProfilePage(),
//                           ));
//                     },
//                     child: Row(
//                       children: [
//                         Text(
//                           "•",
//                           style: TextStyle(fontSize: 26),
//                         ),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Text(
//                           "My Profile",
//                           style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.w600,
//                               color: ColorConstants.white),
//                         )
//                       ],
//                     )),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 TextButton(
//                     onPressed: () {},
//                     child: Row(
//                       children: [
//                         Text(
//                           "•",
//                           style: TextStyle(fontSize: 26),
//                         ),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Text(
//                           "My Notification",
//                           style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.w600,
//                               color: ColorConstants.white),
//                         )
//                       ],
//                     )),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 TextButton(
//                     onPressed: () {},
//                     child: Row(
//                       children: [
//                         Text(
//                           "•",
//                           style: TextStyle(fontSize: 26),
//                         ),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Text(
//                           "My Orders",
//                           style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.w600,
//                               color: ColorConstants.white),
//                         )
//                       ],
//                     )),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 TextButton(
//                     onPressed: () async {
//                           try {
//                     await FirebaseAuth.instance.signOut();
//                     Navigator.pushAndRemoveUntil(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => LoginScreen(),
//                       ),
//                       (route) => false,
//                     );
//                   } catch (e) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: Text(e.toString()),
//                       ),
//                     );
//                   }
//                     },
//                     child: Row(
//                       children: [
//                         Icon(
//                           Icons.logout_rounded,
//                           color: ColorConstants.white,
//                         ),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Text(
//                           "Logout",
//                           style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.w600,
//                               color: ColorConstants.white),
//                         )
//                       ],
//                     ))
//               ],
//             )
//           ],
//         ),
//       );
//   }
// }