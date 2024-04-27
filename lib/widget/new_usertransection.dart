import 'package:flutter/material.dart';

class newtransection extends StatelessWidget {
  final Function addtx;
  var titlecontroller = TextEditingController();
  var amountcontroller = TextEditingController();

  newtransection(this.addtx);

  void submitdata() {
    final entertitle = titlecontroller.text;
    final enteramount = double.parse(amountcontroller.text);

    if (entertitle.isEmpty || enteramount < 0) {
      return;
    }

    addtx(entertitle, enteramount);
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
              onPressed: () {
                submitdata();
              },
            )
          ],
        ),
      ),
    );
  }
}
