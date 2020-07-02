import 'package:flutter/material.dart';

class NewTranscation extends StatelessWidget {
  final amountInput = TextEditingController();
  final titleInput = TextEditingController();
  final Function addTranscation;

  NewTranscation(this.addTranscation);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: "Title"),
            controller: titleInput,
          ),
          TextField(
            decoration: InputDecoration(labelText: "Amount"),
            controller: amountInput,
          ),
          FlatButton(
              color: Colors.purple,
              onPressed: () {
                addTranscation(titleInput.text, double.parse(amountInput.text));
              },
              child: Text("Add Transcation")),
        ],
      ),
    );
  }
}
