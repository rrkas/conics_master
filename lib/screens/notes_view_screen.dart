import 'package:conics_master/widgets/equation_widget.dart';
import 'package:flutter/material.dart';

class NotesViewScreen extends StatelessWidget {
  static const routeName = '/notes-screen';

  @override
  Widget build(BuildContext context) {
    const frac = r'\frac{a}{b}';
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'General Quadratic Equation in 2 variables:',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 5),
              Center(
                child: FittedBox(
                  child: Center(
                    child: EquationWidget(
                      'f(x,y) = ax^2 + 2hxy + by^2 + 2gx + 2fy + c',
                      style: TextStyle(fontSize: 20, color: Colors.indigo),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
