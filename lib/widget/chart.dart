

import 'package:flutter/material.dart';
import '../models/transection.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transections> recentTransections;
  Chart(this.recentTransections);

  List<Map<String, Object>> get groupTransectionlist {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(
        Duration(days: index),
      );
      double? totalsum = 0.0;
      for (int i = 0; i < recentTransections.length; i++) {
        if (recentTransections[i].date?.day == weekday &&
            recentTransections[i].date?.month == weekday.month &&
            recentTransections[i].date?.year == weekday.year) {
          totalsum = recentTransections[i].amount;
        }
      }
        print(DateFormat.E(weekday));
        print(totalsum);

        return {'days': DateFormat.E(weekday), 'amount': totalsum.toString()};
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // print(groupTransectionlist),
      child: Card(
        elevation: 6,
        margin: EdgeInsets.all(10),
        child: Row(
          children: groupTransectionlist.map((data) {
            return Text('${data['days']}:${data['amount']}');
          }).toList(),
        ),
      ),
    );
  }
}
