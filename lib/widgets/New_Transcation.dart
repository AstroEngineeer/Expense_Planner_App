import 'package:flutter/material.dart';

class NewTranscation extends StatefulWidget {
  final Function addTranscation;

  NewTranscation(this.addTranscation);

  @override
  _NewTranscationState createState() => _NewTranscationState();
}

class _NewTranscationState extends State<NewTranscation> {
  final amountInput = TextEditingController();

  final titleInput = TextEditingController();

  void Submit() {
    final amt = double.parse(amountInput.text);
    if (amt <= 0 || titleInput.text.isEmpty) {
      return;
    }
    widget.addTranscation(titleInput.text, amt);
    Navigator.of(context).pop();
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
