import 'package:flutter/material.dart';

class newtransection extends StatelessWidget {
  final Function addtx;
  var titlecontroller = TextEditingController();
  var amountcontroller = TextEditingController();

  newtransection(this.addtx);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              controller: titlecontroller,
              autocorrect: true,
              autofocus: true,
              decoration: InputDecoration(label: Text("Title")),
            ),
            TextField(
              controller: amountcontroller,
              decoration: InputDecoration(label: Text("amount")),
            ),
            ElevatedButton(
                onPressed: () {
                  addtx(titlecontroller, double.parse(amountcontroller.toString()));
                },
                child: Icon(Icons.input)),
          ],
        ),
      ),
    );
  }
}
