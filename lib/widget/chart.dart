import 'package:flutter/material.dart';
import '../models/transection.dart';
import 'package:intl/intl.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transections> recentTransections;
  Chart(this.recentTransections);

  List<Map<String, Object>> get groupTransectionlist {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(
        Duration(days: index),
      );
      var totalsum = 0.0;
      for (int i = 0; i < recentTransections.length; i++) {
        if (recentTransections[i].date?.day == weekday.day &&
            recentTransections[i].date?.month == weekday.month &&
            recentTransections[i].date?.year == weekday.year) {
          totalsum += recentTransections[i].amount as num;
        }
      }
      // print(DateFormat.E().format(weekday));
      // print(totalsum);

      return {
        'days': DateFormat.E().format(weekday).substring(0, 1),
        'amount': totalsum
      };
    }).reversed.toList();
  }

  double get totalspending {
    return groupTransectionlist.fold(0.0, (sum, item) {
      return sum + (item['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 6,
        margin: EdgeInsets.all(10),
        child: Container(
          padding: EdgeInsets.all(20),
          // margin: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: groupTransectionlist.map((data) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                    (data["days"] as String),
                    (data['amount'] as double),
                    totalspending == 0.0
                        ? 0.0
                        : ((data['amount'] as double) / totalspending)),
              );
            }).toList(),
          ),
        ),
      
    );
  }
}
