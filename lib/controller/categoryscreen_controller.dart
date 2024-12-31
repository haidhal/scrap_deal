import 'package:flutter/material.dart';

class CategoryscreenController extends ChangeNotifier {
  // bool isSelected = true;
  List<String> selectedIndex = [];
  void selectedCategory(String uniqueKey) {
    if (selectedIndex.contains(uniqueKey)) {
      selectedIndex.remove(uniqueKey);
    } else {
      selectedIndex.add(uniqueKey);
    }
    notifyListeners();
  }
   bool isSelected(String uniqueKey){
     return selectedIndex.contains(uniqueKey);
   }
}
