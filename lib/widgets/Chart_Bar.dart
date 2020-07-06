import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final double daySpending;
  final double spendingPercent;
  final String day;

  ChartBar(this.daySpending, this.spendingPercent, this.day);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            height: 25,
            child:
                FittedBox(child: Text("₹ ${daySpending.toStringAsFixed(2)}"))),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 100,
          width: 10,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                heightFactor: spendingPercent,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).primaryColor),
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).accentColor,
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 4),
        Text("$day")
      ],
    );
  }
}
