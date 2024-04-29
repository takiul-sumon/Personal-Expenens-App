

import 'package:flutter/material.dart';


// class newtransection extends StatefulWidget {

//   @override
//   State<newtransection> createState() => _newtransectionState();
// }

// class _newtransectionState extends State<newtransection> {

class newtransection extends StatefulWidget {
  final Function addtx;

  newtransection(this.addtx);

  @override
  State<newtransection> createState() => _newtransectionState();
}

class _newtransectionState extends State<newtransection> {
  final titlecontroller = TextEditingController();

  final amountcontroller = TextEditingController();

  void submitdata() {
    final entertitle = titlecontroller.text;
    final enteramount = double.parse(amountcontroller.text);

    if (entertitle.isEmpty || enteramount < 0) {
      return;
    }

    widget.addtx(entertitle, enteramount);
   
  }

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
              onSubmitted: (value) {
                submitdata();
              },
            ),
            TextField(
              decoration: InputDecoration(label: Text("amount")),
              keyboardType: TextInputType.number,
              controller: amountcontroller,
              onSubmitted: (value) {
                submitdata;
              },
            ),
            ElevatedButton(
              child: Text(
                "Add Transection",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: submitdata,
            ),
          ],
        ),
      ),
    );
  }
}
