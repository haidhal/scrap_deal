// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:scrap_deal/utils/color_constants.dart';

class AddDetailsScreen extends StatefulWidget {
  const AddDetailsScreen({super.key});

  @override
  State<AddDetailsScreen> createState() => _AddDetailsScreenState();
}

class _AddDetailsScreenState extends State<AddDetailsScreen> {
   String radioGrpvalue = "";
   TextEditingController societycontroler = TextEditingController();
   TextEditingController addresscontroller = TextEditingController();
   TextEditingController floorcontroller = TextEditingController();
   TextEditingController landMarkcontroller = TextEditingController();
  @override
  
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.blue,
        title: Text("Enter Address Details",
        style: TextStyle(
          color: ColorConstants.white
        ),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start ,
            children: [
            Text("Select Address Type",
            style: TextStyle(
              color: ColorConstants.blue,
              fontSize: 22,
              fontWeight: FontWeight.w500
            ),),
            SizedBox(
              height: 150,
              child: Column(
                children: [
                  Expanded(
                
                child: RadioListTile(
                 title: const Text("Home",
                 style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600
                 ),),
                value: "Home", 
                groupValue: radioGrpvalue, 
                onChanged:  (value) {
                  setState(() {
                    radioGrpvalue = value!;
                  });
                },)),
                  
                 Expanded(
                child: RadioListTile(
                 title: const Text("Office",
                 style: TextStyle( fontSize: 20,
                  fontWeight: FontWeight.w600,
                  
        
                 ),),
                value: "Office", 
                groupValue: radioGrpvalue, 
                onChanged:  (value) {
                  setState(() {
                    radioGrpvalue = value!;
                  });
                },)),
                  Expanded(
                child: RadioListTile(
                 title: const Text("Others",
                 style: TextStyle( fontSize: 20,
                  fontWeight: FontWeight.w600,
                  
        
                 ),),
                value: "others", 
                groupValue: radioGrpvalue, 
                onChanged:  (value) {
                  setState(() {
                    radioGrpvalue = value!;
                  });
                },)),
              
                ],
              ),
            ),
           
             SizedBox(
              height: 15,
             ),
             TextFormField(
              controller: societycontroler,
              decoration: InputDecoration(
                focusColor: Colors.grey,
                hintText: "Enter Society Name",
                 hintStyle: TextStyle(
                  color: ColorConstants.grey
                )
                ),
                
             ),
             SizedBox(height: 20,),
             Text("Enter Full Address",
             style: TextStyle(
             fontSize: 22,
             fontWeight: FontWeight.w500,
             color: ColorConstants.blue
             ),),
               SizedBox(
              height: 15,
             ),
             TextFormField(
              controller: addresscontroller,
              decoration: InputDecoration(
                focusColor: ColorConstants.grey,
                hintText: "Enter Address",
                 hintStyle: TextStyle(
                  color: ColorConstants.grey
                )
              ),
             ),
               SizedBox(
              height: 15,
             ),
             TextField(
              controller: floorcontroller,
              decoration: InputDecoration(
                hintText: "Floor(Optional)",
                 hintStyle: TextStyle(
                  color: ColorConstants.grey
                )
              ),
             ),
               SizedBox(
              height: 15,
             ),
             TextField(
              controller: landMarkcontroller,
              decoration: InputDecoration(
                hintText: "Nearby Landmark(Optional)",
                hintStyle: TextStyle(
                  color: ColorConstants.grey
                )
              ),
             ),
             SizedBox(height: 30,),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 InkWell(
                  onTap: (){
        
                  },
                   child: Container(
                    height: 60,
                    width: 200,
                    decoration: BoxDecoration(
                      color: ColorConstants.blue,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Center(
                      child: Text("SUBMIT",
                      style: TextStyle(
                        color: ColorConstants.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 18
                      ),),
                    ),
                   ),
                 ),
               ],
             )
          ],),
        ),
      ),
    );
  }
}

