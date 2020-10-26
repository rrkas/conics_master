import 'package:flutter/material.dart';
import 'package:katex_flutter/katex_flutter.dart';

class EquationWidget extends StatelessWidget {
  final String equationString;
  final TextStyle style;
  EquationWidget(this.equationString, {this.style});

  @override
  Widget build(BuildContext context) {
    try {
      return KaTeX(
        laTeXCode: Text('\$$equationString\$', style: style),
      );
    } catch (e) {
      print(e);
      return Container();
    }
  }
}
