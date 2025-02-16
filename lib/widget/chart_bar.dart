import 'package:flutter/material.dart';


class ChartBar extends StatelessWidget {
  final String label;
  final double speedingamount;
  final double spendingpctoftotal;

  ChartBar(this.label, this.speedingamount, this.spendingpctoftotal);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, Constraints) {
        return Column(
      children: [
        Container(
          height: Constraints.maxHeight*.15,
          child: FittedBox(child: Text('\$${speedingamount.toStringAsFixed(0)}'))),
        SizedBox(
          height: Constraints.maxHeight*.05,
        ),
        Container(
          height: Constraints.maxHeight*.6,
          width: 10,
          child: Stack(
            children: [
              Container(
                // height: Constraints.maxHeight*.15,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black87, width: 1.0),
                    borderRadius: BorderRadius.circular(10)),
                // color: Color.fromARGB(220, 220, 220, 1),
              ),
              FractionallySizedBox(
                
                heightFactor: spendingpctoftotal,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(5)),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: Constraints.maxHeight*.05,
        ),
        Container(height: Constraints.maxHeight*.15,
          child: Text(label))
      ],
    );
      },
    );
    
  }
}
