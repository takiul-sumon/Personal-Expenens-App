import 'package:flutter/material.dart';
import 'package:personal_expenses/widget/transectionlist.dart';

import './widget/new_usertransection.dart';
import './models/transection.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Transections> Usertransection = [
    Transections(id: "f", title: "Bag", amount: 50, date: DateTime.now())
  ];
  void _addnewtransection(String txtitle, double amount) {
    final Newtx = Transections(
        id: DateTime.now().toString(),
        title: txtitle,
        amount: amount,
        date: DateTime.now());
    setState(() {
      Usertransection.add(Newtx);
    });
  }

  void _startaddnewtrasnsection(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            child: newtransection(_addnewtransection),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("MY HOME PAGE"),
          backgroundColor: Colors.cyan,
          actions: [
            IconButton(
                onPressed: () {
                  _startaddnewtrasnsection(context);
                },
                icon: Icon(Icons.add))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                child: Card(
                  child: Text("Chart"),
                ),
              ),
              // Transectionlist(Usertransection),
              Transectionlist(Usertransection)
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _startaddnewtrasnsection(context);
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
