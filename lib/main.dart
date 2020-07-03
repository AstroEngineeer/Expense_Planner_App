import 'package:flutter/material.dart';
import './widgets/New_Transcation.dart';
import 'models/Transcation.dart';
import './widgets/Transcation_List.dart';

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

class MyAppHome extends StatefulWidget {
  @override
  _MyAppHomeState createState() => _MyAppHomeState();
}

class _MyAppHomeState extends State<MyAppHome> {
  final List _userTranscations = <Transcation>[
    Transcation(id: "t1", title: "Pizza", amt: 500, date: DateTime.now()),
    Transcation(id: "t2", title: "Buger", amt: 100, date: DateTime.now())
  ];

  void _addNewTranscation(String title, double amount) {
    final newtx = Transcation(
        id: DateTime.now().toString(),
        title: title,
        amt: amount,
        date: DateTime.now());

    setState(() {
      _userTranscations.add(newtx);
    });
  }

  _startAddNewTranscation(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return NewTranscation(_addNewTranscation);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () => _startAddNewTranscation(context))
        ],
        title: Text("Expense Planner"),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.amber,
              child: Text("Chart"),
            ),
          ),
          TranscationList(_userTranscations),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTranscation(context),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
