import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTranscation extends StatefulWidget {
  final Function addTranscation;

  NewTranscation(this.addTranscation);

  @override
  _NewTranscationState createState() => _NewTranscationState();
}

class _NewTranscationState extends State<NewTranscation> {
  final amountInput = TextEditingController();
  final titleInput = TextEditingController();
  DateTime selectedDate;

  void presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now())
        .then((date) {
      if (date == null) {
        return;
      } else {
        setState(() {
          selectedDate = date;
        });
      }
    });
  }

  void submit() {
    final amt = double.parse(amountInput.text);
    if (amt <= 0 || titleInput.text.isEmpty || selectedDate == null) {
      return;
    }
    widget.addTranscation(titleInput.text, amt, selectedDate);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        margin: EdgeInsets.only(
            top: 5,
            left: 5,
            right: 5,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: "Title"),
                controller: titleInput,
                onSubmitted: (_) => submit(),
              ),
              TextField(
                decoration: InputDecoration(labelText: "Amount"),
                controller: amountInput,
                onSubmitted: (_) => submit(),
                keyboardType: TextInputType.number,
              ),
              Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Flexible(
                      fit: FlexFit.tight,
                      child: Text(selectedDate == null
                          ? "No Date Selected!"
                          : "Dated picked: ${DateFormat.yMMMd().format(selectedDate)}"),
                    ),
                    FlatButton(
                        onPressed: presentDatePicker,
                        child: Text(
                          "Choose Date",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              ),
              FlatButton(
                  color: Theme.of(context).accentColor,
                  onPressed: submit,
                  child: const Text(
                    "Add Transcation",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
