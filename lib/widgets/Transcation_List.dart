import 'package:Expense_Planner_App/models/Transcation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './TranscationItem.dart';

class TranscationList extends StatelessWidget {
  final List<Transcation> transcations;
  final Function deleteTx;
  TranscationList(this.transcations, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transcations.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: <Widget>[
                const Text(
                  "No transcations added yet!",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  child: Image.asset("assets/images/zzz.png"),
                  height: constraints.maxHeight * 0.7,
                )
              ],
            );
          })
        : ListView.builder(
            itemCount: transcations.length,
            itemBuilder: (context, index) {
              return TranscationItem(
                  transcation: transcations[index], deleteTx: deleteTx);
            });
  }
}
