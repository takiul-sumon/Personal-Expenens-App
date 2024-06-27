import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:personal_expenses/widget/transectionlist.dart';
import './widget/new_usertransection.dart';
import './models/transection.dart';
import './widget/chart.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: "Personal Expenses",
      // theme: ThemeData(backgroundColor: Colors.amberAccent),

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
  bool tap = false;
  final List<Transections> _usertransection = [
    Transections(
      id: 't1',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
  ];
  List<Transections> get _recenttransections {
    return _usertransection.where((tx) {
      return tx.date!.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

  void _addnewtransection(
      String txtitle, double txamount, DateTime choosedate) {
    final Newtx = Transections(
        id: DateTime.now().day.toString(),
        title: txtitle,
        amount: txamount,
        date: choosedate);

    setState(() {
      _usertransection.add(Newtx);
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

  void deleteTransection(String id) {
    setState(() {
      _usertransection.removeWhere((tx) {
        return tx.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final appbar = AppBar(
      title: Text(
        "Pesonal Expenses",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'Head'),
      ),
      centerTitle: true,
      backgroundColor: Colors.cyan,
      actions: [
        IconButton(
            onPressed: () {
              _startaddnewtrasnsection(context);
            },
            icon: Icon(Icons.add))
      ],
    );
    return Scaffold(
      appBar: appbar,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Show Chart"),
                Switch(
                  value: tap,
                  onChanged: (value) {
                    setState(() {
                      tap = value;
                    });
                  },
                )
              ],
            ),
           tap ? 
            Container(
                height: (MediaQuery.of(context).size.height -
                        appbar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    .3,
                child: Chart(_recenttransections)) : Container(
                height: (MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top) *
                    .7,
                child: Transectionlist(_usertransection, deleteTransection)),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _startaddnewtrasnsection(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
