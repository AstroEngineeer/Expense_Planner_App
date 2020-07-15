import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'models/Transcation.dart';
import './widgets/Chart.dart';
import './widgets/New_Transcation.dart';
import './widgets/Transcation_List.dart';

void main(List<String> args) {
  //WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  // [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Expense Planner",
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.teal,
          accentColor: Colors.tealAccent,
          fontFamily: "OpenSans"),
      home: MyAppHome(),
    );
  }
}

class MyAppHome extends StatefulWidget {
  @override
  _MyAppHomeState createState() => _MyAppHomeState();
}

class _MyAppHomeState extends State<MyAppHome> {
  bool _showChart = false;

  final List _userTranscations = <Transcation>[
    //Transcation(id: "t1", title: "Pizza", amt: 500, date: DateTime.now()),
    //Transcation(id: "t2", title: "Buger", amt: 100, date: DateTime.now())
  ];

  void _addNewTranscation(String title, double amount, DateTime selectedDate) {
    final newtx = Transcation(
        id: DateTime.now().toString(),
        title: title,
        amt: amount,
        date: selectedDate);

    setState(() {
      _userTranscations.add(newtx);
    });
  }

  _deleteTranscations(String id) {
    setState(() {
      _userTranscations.removeWhere((element) => element.id == id);
    });
  }

  _startAddNewTranscation(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return NewTranscation(_addNewTranscation);
      },
    );
  }

  List<Transcation> get _recentTranscations {
    return _userTranscations.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  Widget builderLandscape(
      MediaQueryData mediaQuery, AppBar appBar, Container txList) {
    return _showChart
        ? Container(
            height: (mediaQuery.size.height -
                    mediaQuery.padding.top -
                    appBar.preferredSize.height) *
                0.7,
            child: Chart(_recentTranscations))
        : txList;
  }

  List<Widget> builderPotrait(
      MediaQueryData mediaQuery, AppBar appBar, Container txList) {
    return [
      Container(
          height: (mediaQuery.size.height -
                  mediaQuery.padding.top -
                  appBar.preferredSize.height) *
              0.3,
          child: Chart(_recentTranscations)),
      txList
    ];
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    final appBar = AppBar(
      actions: <Widget>[
        IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _startAddNewTranscation(context))
      ],
      title: const Text("Expense Planner"),
    );

    final txList = Container(
      height: (mediaQuery.size.height -
              mediaQuery.padding.top -
              appBar.preferredSize.height) *
          0.7,
      child: TranscationList(_userTranscations, _deleteTranscations),
    );

    return Scaffold(
      appBar: appBar,
      body: ListView(
        children: <Widget>[
          if (isLandScape)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text("Show Chart"),
                Switch.adaptive(
                    activeColor: Theme.of(context).accentColor,
                    value: _showChart,
                    onChanged: (val) {
                      setState(() {
                        _showChart = val;
                      });
                    })
              ],
            ),
          if (isLandScape) builderLandscape(mediaQuery, appBar, txList),
          if (!isLandScape) ...builderPotrait(mediaQuery, appBar, txList),
        ],
      ),
      floatingActionButton: Platform.isIOS
          ? Container()
          : FloatingActionButton(
              onPressed: () => _startAddNewTranscation(context),
              child: const Icon(Icons.add),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
