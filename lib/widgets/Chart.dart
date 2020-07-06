import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/Transcation.dart';
import './Chart_Bar.dart';

class Chart extends StatelessWidget {
  final List<Transcation> recentTranscations;

  Chart(this.recentTranscations);

  List<Map<String, Object>> get dayMapedValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalAmt = 0.0;
      for (int i = 0; i < recentTranscations.length; i++) {
        if (recentTranscations[i].date.day == weekDay.day &&
            recentTranscations[i].date.month == weekDay.month &&
            recentTranscations[i].date.year == weekDay.year) {
          totalAmt += recentTranscations[i].amt;
        }
      }

      return {"day": DateFormat.E().format(weekDay), "amount": totalAmt};
    }).reversed.toList();
  }

  double get percentSpending {
    return dayMapedValues.fold(0.0, (sum, item) {
      return sum + item["amount"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 5,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: dayMapedValues.map((e) {
            return Flexible(
              fit: FlexFit.tight,
              child: percentSpending == 0
                  ? ChartBar(e['amount'], 0, e['day'])
                  : ChartBar(e['amount'],
                      (e['amount'] as double) / percentSpending, e['day']),
            );
          }).toList()),
    );
  }
}
