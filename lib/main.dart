import 'package:Expense_Planner_App/Transcation.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Expense Planner",
      home: MyAppHome(),
    );
  }
}

class MyAppHome extends StatelessWidget {
  List transcations = <Transcation>[
    Transcation(id: "t1", title: "Pizza", amt: 500, date: DateTime.now()),
    Transcation(id: "t2", title: "Buger", amt: 100, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Planner"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.amber,
              child: Text("Chart"),
            ),
          ),
          Column(
              children: transcations.map((tx) {
            return Card(child: Text(tx.title));
          }).toList())
        ],
      ),
    );
  }
}
