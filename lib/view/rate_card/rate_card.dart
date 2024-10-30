import 'package:flutter/material.dart';
import 'package:scrap_deal/utils/color_constants.dart';

class RateCard extends StatefulWidget {
  const RateCard({super.key});

  @override
  State<RateCard> createState() => _RateCardState();
}

class _RateCardState extends State<RateCard> {
  String? dropValue;
  List dropList = ["cpu"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.grey,
        leading: Icon(
          Icons.arrow_back,
          color: ColorConstants.white,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: const EdgeInsets.all(14),
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: ColorConstants.homescreenGreen,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      Text(
                        "E-Waste",
                        style: TextStyle(
                            color: ColorConstants.white, fontSize: 18),
                      ),
                      Text(
                        "items included",
                        style: TextStyle(
                            color: ColorConstants.white, fontSize: 18),
                      )
                    ],
                  ),
                  const Spacer(),
                  DropdownButton(
                      value: dropValue,
                      // hint: Text("select"),

                      items: List.generate(
                          dropList.length,
                          (index) => DropdownMenuItem(
                                child: Text(dropList[index]),
                                value: dropList[index].toString(),
                              )),
                      onChanged: (value) {
                        setState(() {
                          dropValue = value;
                        });
                      }),
                ],
              ),
            ),
          ),
          //  DropdownButton(
          //                   value: dropValue,
          //                   hint: Text("select"),

          //                   items: List.generate(
          //                     dropList.length,
          //                     (index)=>DropdownMenuItem(
          //                       child: Text(dropList[index]),
          //                       value: dropList[index].toString(),
          //                       )),
          //                   onChanged:  (value){
          //                   setState(() {

          //                      dropValue = value;
          //                   });
          //                 }),
        ],
      ),
    );
  }
}
