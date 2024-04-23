import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MY HOME PAGE"),
        backgroundColor: Colors.cyan,
      ),
      body: Column(
        children: [
          Card(
            child: Text("Chart"),
          ),
          Card(
            child: Text(
              "List of Tx",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.lightBlue[400],
            elevation: 5,
          )
        ],
      ),
    );
  }
}
