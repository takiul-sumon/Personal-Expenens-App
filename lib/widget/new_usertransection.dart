import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// class newtransection extends StatefulWidget {

//   @override
//   State<newtransection> createState() => _newtransectionState();
// }

// class _newtransectionState extends State<newtransection> {

class newtransection extends StatefulWidget {
  final Function addtx;

  newtransection(this.addtx);

  @override
  State<newtransection> createState() => _NewtransectionState();
}

class _NewtransectionState extends State<newtransection> {
  final titlecontroller = TextEditingController();

  final amountcontroller = TextEditingController();

  DateTime? _selectdate;

  void submitdata() {
    final entertitle = titlecontroller.text;
    final enteramount = double.parse(amountcontroller.text);

    // if (amountcontroller == null) {
    //   return;
    // }

    if (entertitle.isEmpty || enteramount <= 0 || _selectdate == null) {
      return;
    } else {
      widget.addtx(entertitle, enteramount, _selectdate);
    }
    Navigator.of(context).pop();
  }

  void _presentdatapicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime.now())
        .then((pickdate) {
      if (pickdate == null) {
        return;
      }
      setState(() {
        _selectdate = pickdate;
      });
    });
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
              onSubmitted: (_) {
                submitdata();
              },
            ),
            TextField(
              decoration: InputDecoration(label: Text('amount')),
              keyboardType: TextInputType.number,
              controller: amountcontroller,
              onSubmitted: (_) {
                submitdata;
              },
            ),
            Container(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_selectdate == null
                      ? "No date Choosen"
                      : DateFormat.yMEd().format(_selectdate as DateTime)),
                  ElevatedButton(
                      onPressed: _presentdatapicker,
                      child: const Icon(Icons.add_business)),
                ],
              ),
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
