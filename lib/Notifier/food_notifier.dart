import 'dart:collection';   /// [for UnmodifiableListView]
import 'package:flutter/foundation.dart';
import 'package:prov8/model/food.dart';



class FoodNotifier extends ChangeNotifier{

  List<Food> _foodList = [];

  UnmodifiableListView<Food> get foodList => UnmodifiableListView(_foodList);


  void addFood(Food food) {
    _foodList.add(food);

    notifyListeners();
  }


}