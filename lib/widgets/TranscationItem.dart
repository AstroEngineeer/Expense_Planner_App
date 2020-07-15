import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/Transcation.dart';

class TranscationItem extends StatelessWidget {
  const TranscationItem({
    Key key,
    @required this.transcation,
    @required this.deleteTx,
  }) : super(key: key);

  final Transcation transcation;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
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
              "₹${transcation.amt.toStringAsFixed(2)}",
              style: TextStyle(
                  //color: Colors.black,
                  fontWeight: FontWeight.bold),
            )),
          ),
        ),
        title: Text(
          "${transcation.title}",
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        subtitle: Text("${DateFormat.yMMMd().format(transcation.date)}"),
        trailing: MediaQuery.of(context).size.width > 425
            ? FlatButton.icon(
                onPressed: () => deleteTx(transcation.id),
                icon: const Icon(Icons.delete),
                label: Text("Delete"),
                textColor: Theme.of(context).errorColor,
              )
            : IconButton(
                color: Theme.of(context).errorColor,
                icon: const Icon(Icons.delete),
                onPressed: () => deleteTx(transcation.id),
              ),
      ),
    );
  }
}
