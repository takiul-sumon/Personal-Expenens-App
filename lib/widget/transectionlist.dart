import 'package:flutter/material.dart';
import '../models/transection.dart';

import 'package:intl/intl.dart';

class Transectionlist extends StatelessWidget {
  final List<Transections> transections;
  final Function deletetx;
   Transectionlist(this.transections,this.deletetx);

  @override
  Widget build(BuildContext context) {
    return transections.isEmpty
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
                          .format(transections[index].date as DateTime)),
                          trailing: IconButton(icon: Icon(Icons.delete),onPressed: () => deletetx(transections[index].id),),
                    ),
                  );
                },
                itemCount: transections.length,
              );
  }
}
