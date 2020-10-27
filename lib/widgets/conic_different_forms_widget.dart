import 'package:conics_master/widgets/equation_widget.dart';
import 'package:flutter/material.dart';

class ConicDifferentFormsWidget extends StatelessWidget {
  final List<Widget> words;
  final String equation;
  ConicDifferentFormsWidget({@required this.words, @required this.equation});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          children: words,
          spacing: 4,
        ),
        EquationWidget(equation),
      ],
    );
  }
}
