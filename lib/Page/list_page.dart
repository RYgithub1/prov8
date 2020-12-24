import 'package:flutter/material.dart';
import 'package:prov8/NotifierModel/food_notifier_model.dart';
import 'package:prov8/NotifierModel/user_notifier_model.dart';
import 'package:provider/provider.dart';



class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    FoodNotifierModel foodNotifier = Provider.of<FoodNotifierModel>(context);
    UserNotifierModel userNotifier = Provider.of<UserNotifierModel>(context);

    print("comm: ListView rebuild check");


    return Scaffold(
      appBar: AppBar(title: Text("FOOD: CHECK PAGE")),
      body: Container(
        margin: EdgeInsets.all(20),
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


            /// [Stop to Rebuild, coz of here]
            // Text("USER AGE: "+userNotifier.userAge.toString()),
            Consumer<UserNotifierModel>(
              builder: (context, val, child){
                print(userNotifier.userName);
                print(userNotifier.userAge);
                // return Container();
                return Text("USER AGE: "+userNotifier.userAge.toString());
              },
            ),


            RaisedButton(
              child: Text(
                "btn 1",
                style: TextStyle(color: Colors.purple, fontSize: 16),
              ),
              onPressed: ()
                => {print("btn 1")},
            ),

            RaisedButton(
              child: Text(
                // "btn 2",
                "Increment Age",
                style: TextStyle(color: Colors.redAccent, fontSize: 16),
              ),
              onPressed: ()
                // => {print("btn 2")},
                => userNotifier.incrementAge(),
            ),

          ],
        ),
      ),
    );
  }
}