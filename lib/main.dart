import 'package:flutter/material.dart';
import 'package:personal_expenses/widget/user_transection.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Sumon",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MY HOME PAGE"),
        backgroundColor: Colors.cyan,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Text("Chart"),
            ),
            Usertransection(),
            Card(
              child: Container(
                width: double.infinity,
                child: Center(
                  child: Text(
                    "List of Tx",
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 253, 253),
                        fontSize: 20),
                  ),
                ),
              ),
              color: Colors.lightBlue[400],
              elevation: 5,
            ),
          ],
        ),
      ),
    );
  }
}
