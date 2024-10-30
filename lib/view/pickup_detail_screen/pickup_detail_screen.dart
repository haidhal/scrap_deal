import 'package:flutter/material.dart';
import 'package:scrap_deal/utils/color_constants.dart';
import 'package:scrap_deal/view/add_details_screen/add_details_screen.dart';

class PickUpDetailScreen extends StatelessWidget {
  const PickUpDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
       
      }),
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
        child: InkWell(
          onTap: (){
             Navigator.push(context,
            MaterialPageRoute(builder: (context) => AddDetailsScreen()));  
          },
          child: Column(
            children: [
              Container(
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
                      style: TextStyle(color: ColorConstants.white, fontSize: 18),
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
