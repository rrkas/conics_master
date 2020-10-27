import 'package:conics_master/widgets/equation_widget.dart';
import 'package:flutter/material.dart';
import 'package:fraction/fraction.dart';

class ConicPropertyWidget extends StatelessWidget {
  final String property, formula;
  final double flex;
  final bool column;
  ConicPropertyWidget(this.property, this.formula, {this.flex = 5 / 3, this.column = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: column
          ? Column(
              children: [
                Align(alignment: Alignment.centerLeft, child: FittedBox(child: EquationWidget(property))),
                Container(alignment: Alignment.centerLeft, height: 30, child: FittedBox(child: EquationWidget(formula, style: TextStyle(fontSize: 18)))),
              ],
            )
          : Row(
              children: [
                Expanded(
                  flex: Fraction.fromDouble(flex).numerator,
                  child: Align(alignment: Alignment.centerLeft, child: FittedBox(child: EquationWidget(property))),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: Fraction.fromDouble(flex).denominator,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: 30,
                    child: FittedBox(
                      child: EquationWidget(formula, style: TextStyle(fontSize: 18)),
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
