import 'package:flutter/material.dart';
import 'package:prov8/NotifierModel/food_notifier_model.dart';
import 'package:prov8/NotifierModel/user_notifier_model.dart';
import 'package:prov8/Page/home_page.dart';
import 'package:provider/provider.dart';



/// [0 Provider]
// void main() {runApp(MyApp());}
/// [1 Provider]
// void main() {
//   runApp(
//     ChangeNotifierProvider(
//       create: (context) => FoodNotifierModel(),
//       child: MyApp(),
//     ),
//   );
// }
/// [Multi Provider]
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FoodNotifierModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserNotifierModel("NinjaCoder"),
        ),
      ],
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
