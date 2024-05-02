import 'package:flutter/material.dart';
import '../models/transection.dart';

class Chart extends StatelessWidget {
  final List<Transections> recentTransections;
  Chart(this.recentTransections);
  
  List<Map<String, Object>> get groupTransectionlist {
    return List.generate(7, (index) {
      return {};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 6,
        margin: EdgeInsets.all(10),
        child: Row(
          children: [
            Column(
              children: [Text("F"), Text("S"), Text("S"), Text("M"), Text("T")],
            )
          ],
        ),
      ),
    );
  }
}
