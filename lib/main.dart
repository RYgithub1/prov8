import 'package:flutter/material.dart';
import 'package:prov8/Notifier/food_notifier.dart';
import 'package:prov8/Page/home_page.dart';
import 'package:provider/provider.dart';


/// [0 Provider]
// void main() {runApp(MyApp());}
/// [1 Provider]
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => FoodNotifier(),
      child: MyApp(),
    ),
  );
}





class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'prov8',
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      home: HomePage(),
    );
  }
}
