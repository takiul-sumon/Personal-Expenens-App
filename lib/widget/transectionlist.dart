import 'package:flutter/material.dart';
import '../models/transection.dart';

import 'package:intl/intl.dart';

class Transectionlist extends StatelessWidget {
  final List<Transections> transections;
  const Transectionlist(this.transections);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: transections.isEmpty
            ? Container(
                // height: 300,
                width: 500,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/1111.png',
                      fit: BoxFit.fill,
                    )
                  ],
                ),
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 20,
                        child: FittedBox(
                            child: Text(
                          '${transections[index].amount}',
                        )),
                      ),
                      title: Text('${transections[index].title}'),
                      subtitle: Text(DateFormat.yMMMd()
                          .format(transections[index].date as dynamic)),
                    ),
                  );
                },
                itemCount: transections.length,
              ));
  }
}
