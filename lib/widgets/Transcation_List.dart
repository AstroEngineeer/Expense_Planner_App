import 'package:Expense_Planner_App/models/Transcation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TranscationList extends StatelessWidget {
  final List<Transcation> transcations;

  TranscationList(this.transcations);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: transcations.map((tx) {
      return Card(
          child: Row(
        children: <Widget>[
          Container(
            child: Text("₹ ${tx.amt}",
                style: TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.black, style: BorderStyle.solid, width: 2),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  child: Text(
                tx.title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              )),
              Container(
                  child: Text(
                DateFormat.yMMMd().format(tx.date),
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              )),
            ],
          )
        ],
      ));
    }).toList());
  }
}
