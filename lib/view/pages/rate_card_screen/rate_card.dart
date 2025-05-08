import 'package:flutter/material.dart';
import 'package:scrap_deal/dummy_db.dart';
import 'package:scrap_deal/utils/color_constants.dart';

class RateCard extends StatefulWidget {
  const RateCard({super.key});

  @override
  State<RateCard> createState() => _RateCardState();
}

class _RateCardState extends State<RateCard> {
  String? dropValue;
  Map<int, String?> selectedItem = {};
  List dropList = ["cpu  - 150₹ /PC", "Laptop  - 100/PC"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.homescreenGreen,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: ColorConstants.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => Container(
                  padding: const EdgeInsets.all(14),
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: ColorConstants.homescreenGreen,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              Image.asset(DummyDb.categoryList[index]["image"]),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            DummyDb.categoryList[index]["category"],
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
                          dropdownColor: Colors.black,
                          //  dropdownColor: ColorConstants.dropdownColor,
                          menuWidth: double.infinity,
                          borderRadius: BorderRadius.circular(16),
                          items: List.generate(
                              dropList.length,
                              (index) => DropdownMenuItem(
                                    child: Text(
                                      dropList[index],
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
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
                separatorBuilder: (context, index) => const SizedBox(
                  height: 15,
                ),
                itemCount: DummyDb.categoryList.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
