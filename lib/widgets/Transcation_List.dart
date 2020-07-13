import 'package:Expense_Planner_App/models/Transcation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TranscationList extends StatelessWidget {
  final List<Transcation> transcations;
  final Function deleteTx;
  TranscationList(this.transcations, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transcations.isEmpty
        ? Column(
            children: <Widget>[
              Text(
                "No transcations added yet!",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                  child: Image.asset("assets/images/zzz.png"), height: 300)
            ],
          )
        : ListView.builder(
            itemCount: transcations.length,
            itemBuilder: (context, index) {
              return Card(
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      foregroundColor: ThemeData.dark().primaryColor,
                      backgroundColor: Theme.of(context).primaryColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FittedBox(
                            //fit: BoxFit.fill,
                            child: Text(
                          "₹${transcations[index].amt.toStringAsFixed(2)}",
                          style: TextStyle(
                              //color: Colors.black,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                    title: Text(
                      "${transcations[index].title}",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    subtitle: Text(
                        "${DateFormat.yMMMd().format(transcations[index].date)}"),
                    trailing: MediaQuery.of(context).size.width > 425
                        ? FlatButton.icon(
                            onPressed: () => deleteTx(transcations[index].id),
                            icon: Icon(Icons.delete),
                            label: Text("Delete"),
                            textColor: Theme.of(context).errorColor,
                          )
                        : IconButton(
                            color: Theme.of(context).errorColor,
                            icon: Icon(Icons.delete),
                            onPressed: () => deleteTx(transcations[index].id),
                          ),
                  ));
            });
  }
}
