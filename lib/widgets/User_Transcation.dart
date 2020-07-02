import 'package:Expense_Planner_App/models/Transcation.dart';
import 'package:Expense_Planner_App/widgets/New_Transcation.dart';
import 'package:Expense_Planner_App/widgets/Transcation_List.dart';
import 'package:flutter/material.dart';

class UserTranscation extends StatefulWidget {
  @override
  _UserTranscationState createState() => _UserTranscationState();
}

class _UserTranscationState extends State<UserTranscation> {
  final List _Usertranscations = <Transcation>[
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
      _Usertranscations.add(newtx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTranscation(_addNewTranscation),
        TranscationList(_Usertranscations),
      ],
    );
  }
}
