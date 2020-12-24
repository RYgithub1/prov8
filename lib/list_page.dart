import 'package:flutter/material.dart';


class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CHECK PAGE")),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Column(
          children: <Widget>[
            SizedBox(height: 100),
            ListView.builder(
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) => Text(
                "pppppppppppp",
              ),
            ),
            SizedBox(height: 100),

            RaisedButton(
              child: Text(
                "btn 1",
                style: TextStyle(color: Colors.limeAccent, fontSize: 16),
              ),
              onPressed: () => {},
            ),

            RaisedButton(
              child: Text(
                "btn 2",
                style: TextStyle(color: Colors.redAccent, fontSize: 16),
              ),
              onPressed: () => {},
            ),

          ],
        ),
      ),
    );
  }
}