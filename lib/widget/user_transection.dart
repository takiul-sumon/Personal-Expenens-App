import 'package:personal_expenses/models/transection.dart';
import 'package:personal_expenses/widget/new_usertransection.dart';
import './transectionlist.dart';

import 'package:flutter/material.dart';

class Usertransection extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Usertransection();
  }
}

class _Usertransection extends State<Usertransection> {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        newtransection(_addnewtransection),
        Transectionlist(Usertransection)
      ],
    );
  }
}