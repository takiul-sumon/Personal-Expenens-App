import 'package:flutter/material.dart';
import './transection.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Sumon",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transections> transection = [
    Transections(id: "f", title: "Bag", amount: 50, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MY HOME PAGE"),
        backgroundColor: Colors.cyan,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            child: Text("Chart"),
          ),
          Card(
            child: Container(
              width: double.infinity,
              child: Center(
                child: Text(
                  "List of Tx",
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 253, 253), fontSize: 20),
                ),
              ),
            ),
            color: Colors.lightBlue[400],
            elevation: 5,
          )
        ],
      ),
    );
  }
}
