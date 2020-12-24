import 'package:flutter/material.dart';
import 'package:prov8/NotifierModel/food_notifier_model.dart';
import 'package:prov8/NotifierModel/user_notifier_model.dart';
import 'package:provider/provider.dart';



class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    FoodNotifierModel foodNotifier = Provider.of<FoodNotifierModel>(context);
    // UserNotifierModel userNotifier = Provider.of<UserNotifierModel>(context);
    /// [Stop rebuild()]
    UserNotifierModel userNotifier = Provider.of<UserNotifierModel>(context, listen: false);

    print("comm: ListView rebuild check");


    return Scaffold(
      // appBar: AppBar(title: Text("FOOD: CHECK PAGE")),
      appBar: AppBar(
        // title: Text("FOOD_CHECK: "+userNotifier.userName)),
        title: Text("FOOD_CHECK")),

      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            SizedBox(height: 12),
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
            // Consumer<UserNotifierModel>(
            //   builder: (context, valval, child){
            //     print(valval.userName);
            //     print(valval.userAge);
            //     // return Container();
            //     return Text("USER AGE: "+valval.userAge.toString());
            //   },
            // ),
            /// [Go Selector]
            // (new) Selector<UserNotifierModel, int> Selector({
            //     Key key,
            //     Widget Function(BuildContext, int, Widget) builder,
            //     int Function(BuildContext, UserNotifierModel) selector,
            //     bool Function(int, int) shouldRebuild,
            //     Widget child,
            // }),
            Selector<UserNotifierModel, int>(
              selector: (context, valvaluser) => valvaluser.userAge,
              /// selector: (context, valvaluser) {return valvaluser.userAge;},  /// if {return XXX;},
              // builder: (context, valvalage, child) => Text("USER AGE: "+valvalage.toString(),),
              /// builder: (context, valvalage, child){return Text("USER AGE: "+valvalage.toString());},  /// if {return XXX;},
              builder: (context, valvalage, child){
                print("comm: Consumer call user age");
                return Text("USER AGE: "+valvalage.toString());
              },
            ),

            // Selector<UserNotifierModel, String>(
            //   selector: (context, valvaluser) => valvaluser.userName,
            //   builder: (context, valvalname, child) => Text("USER NAME: "+valvalname.toString(),),
            // ),
            Consumer<UserNotifierModel>(
              // builder: (context, valval, child) => Text("USER NAME: "+valval.userName.toString(),),
              builder: (context, valval, child) {
                print("comm: Consumer call user name");
                return Text("USER NAME: "+valval.userName.toString());
              },
            ),


            SizedBox(height: 20),
            RaisedButton(
              child: Text(
                // "btn 1",
                "Increment Age",
                style: TextStyle(color: Colors.redAccent, fontSize: 16),
              ),
              onPressed: ()
                // => {print("btn 1")},
                => userNotifier.incrementAge(),
            ),

            RaisedButton(
              child: Text(
                // "btn 2",
                "Change Position",
                style: TextStyle(color: Colors.purple, fontSize: 16),
              ),
              onPressed: ()
                // => {print("btn 2")},
                => userNotifier.setUserName("SamuraiManager")
            ),

          ],
        ),
      ),
    );
  }
}