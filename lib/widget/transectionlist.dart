import 'package:flutter/material.dart';
import '../models/transection.dart';

import 'package:intl/intl.dart';

class Transectionlist extends StatelessWidget {
  List<Transections> transections;
  Transectionlist(this.transections);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              child: Row(
                children: [
                  Container(
                    // height: 100,
                    // width: 100,
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 253, 249, 249),
                      border: Border.all(
                        color: Colors.blue,
                        width: 1,
                      ),
                    ),
                    // color: Colors.deepOrange,
                    child: Text(
                      '\$ ${transections[index].amount}',
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
                        '${transections[index].title}',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.lightBlue),
                      ),
                      Text(
                        DateFormat.MMMMEEEEd().format(DateTime.now()),
                        style: TextStyle(
                            fontWeight: FontWeight.w200, color: Colors.grey),
                      )
                    ],
                  )
                ],
              ),
              elevation: 12,
            );
          },
          itemCount: transections.length,
        ));
  }
}
