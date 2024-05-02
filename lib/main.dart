import 'package:flutter/material.dart';
import 'package:personal_expenses/widget/transectionlist.dart';

import './widget/new_usertransection.dart';

import './models/transection.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Personal Expenses",
      theme: ThemeData(backgroundColor: Colors.amberAccent),
      home: Myhomepage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Myhomepage extends StatefulWidget {
  const Myhomepage({super.key});

  @override
  State<Myhomepage> createState() => _MyhomepageState();
}

class _MyhomepageState extends State<Myhomepage> {
  final List<Transections> transection = [
    // Transections(
    //   id: 't1',
    //   title: 'New Shoes',
    //   amount: 69.99,
    //   date: DateTime.now(),
    // ),
  ];

  void _addnewtransection(String txtitle, double txamount) {
    final Newtx = Transections(
        id: DateTime.now().toString(),
        title: txtitle,
        amount: txamount,
        date: DateTime.now());
    setState(() {
      transection.add(Newtx);
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
    return Scaffold(
      // MaterialApp(

      appBar: AppBar(
        title: Text(
          "Pesonal Expenses",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'Heading'),
        ),
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
                child: Text(
                  "Chart",
                  style: TextStyle(
                      fontFamily: 'Heading', fontWeight: FontWeight.bold),
                ),
              ),
            ),
            // Transectionlist(Usertransection),
            Transectionlist(transection)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _startaddnewtrasnsection(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
