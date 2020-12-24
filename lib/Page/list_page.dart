import 'package:flutter/material.dart';



class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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

              itemCount: 1,
              itemBuilder: (BuildContext context, int index) => Text(
                "pppppppppppp",
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