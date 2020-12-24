import 'dart:collection';   /// [for UnmodifiableListView]
import 'package:flutter/foundation.dart';
import 'package:prov8/model/food.dart';



class FoodNotifierModel extends ChangeNotifier{

  /// [Need model data]
  List<Food> _foodList = [];

  /// [Need getter]
  UnmodifiableListView<Food> get foodList => UnmodifiableListView(_foodList);

  /// [Need method]
  void addFood(Food food) {
    _foodList.add(food);

    notifyListeners();
  }


}