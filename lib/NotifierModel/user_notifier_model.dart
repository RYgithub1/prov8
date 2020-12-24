import 'package:flutter/foundation.dart';



/// [IF Function of ClassFood and ClassFoodnotifier merge in this field]
class UserNotifierModel extends ChangeNotifier{

  /// [Accept Data from other widget]
  /// [const CLASSNAME({Key key}) : super(key: key);]
  // UserNotifierModel(this._userName, this._userAge);
  UserNotifierModel(this._userName);



  /// [--- Need model data ---]
  String _userName;
  // int _userAge;
  int _userAge = 0;  /// [Non data from other widget -> Set initial]



  /// [--- Need getter ---]
  String get userName => _userName;
  int get userAge => _userAge;



  /// [--- Need method ---]
  void setUserName(String userName) {
    _userName = userName;
    notifyListeners();
  }
  // void setUserAge(int userAge) {
  void incrementAge() {
    _userAge++;
    _userAge++;
    _userAge++;
    notifyListeners();
  }

}
