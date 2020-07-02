import 'package:flutter/material.dart';

class NewTranscation extends StatelessWidget {
  final amountInput = TextEditingController();
  final titleInput = TextEditingController();
  final Function addTranscation;

  NewTranscation(this.addTranscation);

  void Submit() {
    final amt = double.parse(amountInput.text);
    if (amt <= 0 || titleInput.text.isEmpty) {
      return;
    }
    addTranscation(titleInput.text, amt);
  }

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
            onSubmitted: (_) => Submit(),
          ),
          TextField(
            decoration: InputDecoration(labelText: "Amount"),
            controller: amountInput,
            onSubmitted: (_) => Submit(),
            keyboardType: TextInputType.number,
          ),
          FlatButton(
              color: Colors.purple,
              onPressed: Submit,
              child: Text("Add Transcation")),
        ],
      ),
    );
  }
}
