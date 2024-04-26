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
            decoration: InputDecoration(label: Text("Title")),
            controller: titlecontroller,
            ),
            TextField(
              
              decoration: InputDecoration(label: Text("amount")),
              controller: amountcontroller,
            ),
            ElevatedButton(
                child: Icon(Icons.input),onPressed: () {
                  addtx(titlecontroller.text, double.parse(amountcontroller.text));
                },)
                
            
          ],
        ),
      ),
    );
  }
}
