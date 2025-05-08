import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrap_deal/utils/color_constants.dart';
import 'package:scrap_deal/view/pages/category_screen/category_screen.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category, required this.image});
  final String image;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 200,
      decoration: BoxDecoration(
          color: ColorConstants.homescreenGreen,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(60), bottomLeft: Radius.circular(60))),
      child: Row(
        children: [
          SizedBox(width: 150, child: Image.asset(image)),
          const SizedBox(
            width: 20,
          ),
          Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Text(
                category,
                style: GoogleFonts.lora(
                    textStyle:
                        TextStyle(fontSize: 20, color: ColorConstants.white)),
                // style: TextStyle(color: ColorConstants.white, fontSize: 20),
              ),
            ],
          ),
          const Spacer(),
          Column(
            children: [
              const Spacer(),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategoryScreen()));
                  },
                  icon: Icon(
                    Icons.arrow_forward_rounded,
                    color: ColorConstants.white,
                    size: 40,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
