import 'package:flutter/material.dart';
import 'package:prov8/NotifierModel/food_notifier_model.dart';
import 'package:prov8/Page/list_page.dart';
import 'package:prov8/model/food.dart';
import 'package:provider/provider.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {

  String _currentName;
  String _currentColor;
  // List<Food> _foodList = [];   // No need, coz Use data with Provider directly

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // print(_foodList.length);
    FoodNotifierModel foodNotifier = Provider.of<FoodNotifierModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text("FOOD: HOME PAGE")),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                /// [NAME]
                TextFormField(
                  decoration: InputDecoration(labelText: "NAME"),
                  initialValue: null,
                  validator:(String value) {
                    if(value.isEmpty) {
                      return "NAME is required";
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    _currentName = value;
                    print("NAME: $value");
                  },
                ),
                /// [COLOR]
                TextFormField(
                  decoration: InputDecoration(labelText: "COLOR"),
                  initialValue: null,
                  validator:(String value) {
                    if(value.isEmpty) {
                      return "COLOR is required";
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    _currentColor = value;
                    print("COLOR: $value");
                  },
                ),
                SizedBox(height: 20),


                /// [btn: ADD FOOD]
                RaisedButton(
                  child: Text(
                    "ADD FOOD",
                    style: TextStyle(color: Colors.lightGreen, fontSize: 20),
                  ),
                  onPressed: () {
                    if(!_formKey.currentState.validate()) return;

                    _formKey.currentState.save();

                    setState(() {
                      // _foodList.add(
                      foodNotifier.addFood(
                        Food(_currentName, _currentColor)
                      );
                    });
                  },
                ),


                /// [btn: Navigator]
                FlatButton(
                  child: Text(
                    ">> CHECK PAGE",
                    style: TextStyle(color: Colors.pink[200], fontSize: 16),
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ListPage())
                  ),
                ),


                /// [display]
                SizedBox(height: 20),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,

                  // itemCount: _foodList.length,
                  itemCount: foodNotifier.foodList.length,
                  itemBuilder: (BuildContext context, int index) => Column(
                    children: <Widget>[
                      // Text(_foodList[index].name),
                      // Text(_foodList[index].color),
                      Text(foodNotifier.foodList[index].name),
                      Text(foodNotifier.foodList[index].color),

                      Divider(thickness: 2, color: Colors.lightBlue),
                      SizedBox(height:8),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}