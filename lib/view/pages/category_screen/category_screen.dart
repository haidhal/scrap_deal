// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrap_deal/bloc/cubits/category_cubit.dart';
import 'package:scrap_deal/controller/categoryscreen_controller.dart';
import 'package:scrap_deal/dummy_db.dart';
import 'package:scrap_deal/utils/color_constants.dart';
import 'package:scrap_deal/view/pages/pickup_detail_screen/pickup_detail_screen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // final screenwidth = MediaQuery.of(context).size.width;
    final categoryProvider = context.watch<CategoryscreenController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.homescreenGreen,
        foregroundColor: Colors.white,
      ),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
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
                    "Selected(${categoryProvider.selectedIndex.length})",
                    style: TextStyle(
                      color: ColorConstants.white,
                      fontSize: 22,
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
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ColorConstants.homescreenGreen),
                  child: Center(
                    child: Text(
                      "Proceed",
                      style: TextStyle(
                        color: ColorConstants.white,
                        fontSize: 22,
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
                  onTap: () {
                    context.read<CategoryCubit>().selectedCategoryIndex(index);
                  },
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: ColorConstants.mainbalck,
                        radius: 60,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Image.asset(
                            DummyDb.categoryList[index]["image"],
                          ),
                        ),
                      ),
                      Text(
                        DummyDb.categoryList[index]["category"],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
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
          BlocBuilder<CategoryCubit, int>(
            builder: (context, state) {
              return Expanded(
                child: GridView.builder(
                    itemCount: DummyDb
                        .categoryDetails[0]
                            [DummyDb.categoryList[state]["category"]]
                        .length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: size.width < 600 ? 2 : 3,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 25,
                      mainAxisExtent: 70,
                    ),
                    itemBuilder: (context, index) {
                      final category = DummyDb.categoryList[state]["category"];
                      final item = DummyDb.categoryDetails[0][category][index];

                      final uniqueKey = '$category-${item['itemName']}';
                      final isSelected =
                          categoryProvider.selectedIndex.contains(uniqueKey);
                      return InkWell(
                        onTap: () {
                          context
                              .read<CategoryscreenController>()
                              .selectedCategory(uniqueKey);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: isSelected
                                  ? ColorConstants.homescreenGreen
                                  : ColorConstants.mainbalck),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  isSelected
                                      ? Icon(
                                          Icons.check_circle_outline_outlined,
                                          color: ColorConstants.grey,
                                        )
                                      : Icon(
                                          Icons.circle_outlined,
                                          color: ColorConstants.white,
                                        ),
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${DummyDb.categoryDetails[0][DummyDb.categoryList[state]["category"]][index]['itemName']}',
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        '${DummyDb.categoryDetails[0][DummyDb.categoryList[state]["category"]][index]['itemPrice']}',
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              );
            },
          )
        ]),
      ),
    );
  }
}
