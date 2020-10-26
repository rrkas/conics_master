import 'package:conics_master/widgets/equation_widget.dart';
import 'package:flutter/material.dart';
import 'package:fraction/fraction.dart';

class ConicPropertyRow extends StatelessWidget {
  final String property, formula;
  final double flex;
  ConicPropertyRow(this.property, this.formula, [this.flex]);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        children: [
          Expanded(
            flex: flex == null ? 5 : Fraction.fromDouble(flex).numerator,
            child: Align(alignment: Alignment.centerLeft, child: FittedBox(child: EquationWidget(property))),
          ),
          SizedBox(width: 10),
          Expanded(
            flex: flex == null ? 3 : Fraction.fromDouble(flex).denominator,
            child: Container(
              alignment: Alignment.centerLeft,
              height: 30,
              child: FittedBox(
                child: EquationWidget(
                  formula,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
