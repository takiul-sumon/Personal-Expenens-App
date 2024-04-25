
import 'package:personal_expenses/models/transection.dart';
import 'transectionlist.dart';

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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Transectionlist(Usertransection)
      ],
    );
  }
}
