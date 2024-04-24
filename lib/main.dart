import 'package:flutter/material.dart';

import './transection.dart';
import 'package:intl/intl_browser.dart';

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
          ),
          Column(
            children: transection.map((tx) {
              return Card(
                child: Row(
                  children: [
                    Container(
                      // height: 100,
                      // width: 100,
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 253, 249, 249),
                        border: Border.all(
                          color: Colors.blue,
                          width: 1,
                        ),
                      ),
                      // color: Colors.deepOrange,
                      child: Text(
                        '\$' + tx.amount.toString(),
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.blue,
                            fontWeight: FontWeight.w600),
                      ),
                      padding: EdgeInsets.all(8),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tx.title.toString(),
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.lightBlue),
                        ),
                        Text(
                          tx.date.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.w200, color: Colors.grey),
                        )
                      ],
                    )
                  ],
                ),
                elevation: 12,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
