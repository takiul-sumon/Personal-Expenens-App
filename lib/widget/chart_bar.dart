import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double speedingamount;
  final double spendingpctoftotal;

  ChartBar(this.label, this.speedingamount, this.spendingpctoftotal);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('\$${speedingamount.toStringAsFixed(0)}'),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black87, width: 1.0),
                    borderRadius: BorderRadius.circular(20)),
                // color: Color.fromARGB(220, 220, 220, 1),
              ),
              FractionallySizedBox(
                heightFactor: spendingpctoftotal,
                
                child: Container(
                  decoration: BoxDecoration(color: Colors.amber),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 4,
        )
      ],
    );
  }
}
