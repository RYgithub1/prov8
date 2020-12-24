import 'dart:html';

import 'package:flutter/material.dart';
import 'package:prov8/list_page.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {

  String _currentName;
  String _currentColor;
  List<Food> _foodList = [];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print(_foodList.length);

    return Scaffold(
      appBar: AppBar(title: Text("HOME PAGE")),
      body: Container(
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

              SizedBox(height: 200),
              ListView.builder(
                itemCount: _foodList.length,
                itemBuilder: (BuildContext context, int index) => Column(
                  children: <Widget>[
                    Text(_foodList[index].name),
                    Text(_foodList[index].color),
                    Divider(thickness: 2, color: Colors.lightBlue),
                    // Padding(padding: EdgeInsets.all(8)),
                    SizedBox(height:8),
                  ],
                ),
              ),


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
                    _foodList.add(
                      Food(_currentName, _currentColor)
                    );
                  });
                },
              ),


              /// [btn: Navigator]
              FlatButton(
                child: Text(
                  "CHECK",
                  style: TextStyle(color: Colors.pink[200], fontSize: 12),
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListPage())
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}