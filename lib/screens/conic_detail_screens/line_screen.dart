import 'package:conics_master/utils/tex_utils.dart';
import 'package:conics_master/widgets/conic_property_row.dart';
import 'package:conics_master/widgets/equation_widget.dart';
import 'package:flutter/material.dart';

class LineScreen extends StatelessWidget {
  static const routeName = '/line-screen';

  @override
  Widget build(BuildContext context) {
    final form_ratio = 1 / 1;
    return Scaffold(
      appBar: AppBar(title: Text('Straight Lines')),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          Text('General Equation of a Straight Line:'),
          SizedBox(height: 5),
          Center(child: EquationWidget('ax + by + c = 0')),
          SizedBox(height: 10),
          Divider(),
          SizedBox(height: 10),
          Text('Analysis:', style: TextStyle(fontSize: 17)),
          SizedBox(height: 10),
          ConicPropertyRow('Slope', TeXUtils.frac('-a', 'b')),
          ConicPropertyRow('x-intercept', TeXUtils.frac('-c', 'a')),
          ConicPropertyRow('y-intercept', TeXUtils.frac('-c', 'b')),
          ConicPropertyRow('Distance\\ from\\ (0,0)', TeXUtils.frac('|c|', TeXUtils.sqrt('a^2 + b^2'))),
          ConicPropertyRow('Distance\\ from\\ (x_1,y_1)', TeXUtils.frac('|ax_1 + by_2 + c|', TeXUtils.sqrt('a^2 + b^2'))),
          SizedBox(height: 10),
          Divider(),
          SizedBox(height: 10),
          Text('Different Forms of Lines:', style: TextStyle(fontSize: 17)),
          SizedBox(height: 10),
          ConicPropertyRow('General\\ Form', 'ax + by + c = 0', form_ratio),
          ConicPropertyRow('Standard\\ Form', 'ax + by = -c', form_ratio),
          ConicPropertyRow('Point-Slope\\ Form\\ (x_1,y_1)', '(y-y_1) = m(x-x_1)', form_ratio),
          ConicPropertyRow('General\\ Form', 'ax + by + c = 0', form_ratio),
          ConicPropertyRow('General\\ Form', 'ax + by + c = 0', form_ratio),
        ],
      ),
    );
  }
}
