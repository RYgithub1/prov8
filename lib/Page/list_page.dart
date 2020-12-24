import 'package:flutter/material.dart';
import 'package:prov8/Notifier/food_notifier.dart';
import 'package:provider/provider.dart';



class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context);

    return Scaffold(
      appBar: AppBar(title: Text("FOOD: CHECK PAGE")),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,

              // itemCount: 1,
              itemCount: foodNotifier.foodList.length,
              itemBuilder: (BuildContext context, int index) => Text(
                // "pppppppppppp",
                foodNotifier.foodList[index].name,
              ),
            ),
            SizedBox(height: 20),

            RaisedButton(
              child: Text(
                "btn 1",
                style: TextStyle(color: Colors.limeAccent, fontSize: 16),
              ),
              onPressed: () => {print("btn 1")},
            ),

            RaisedButton(
              child: Text(
                "btn 2",
                style: TextStyle(color: Colors.redAccent, fontSize: 16),
              ),
              onPressed: () => {print("btn 2")},
            ),

          ],
        ),
      ),
    );
  }
}