import 'package:conics_master/utils/tex_utils.dart';
import 'package:conics_master/widgets/conic_different_forms_widget.dart';
import 'package:conics_master/widgets/conic_property_widget.dart';
import 'package:conics_master/widgets/equation_widget.dart';
import 'package:conics_master/widgets/numbered_column_widget.dart';
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
          NumberedColumnWidget(
            children: [
              ConicPropertyWidget(TeXUtils.plainText('Slope'), TeXUtils.frac('-a', 'b')),
              ConicPropertyWidget(TeXUtils.plainText('x-intercept'), TeXUtils.frac('-c', 'a')),
              ConicPropertyWidget(TeXUtils.plainText('y-intercept'), TeXUtils.frac('-c', 'b')),
              ConicPropertyWidget('${TeXUtils.plainText('Distance from ')}(0,0)', TeXUtils.frac('|c|', TeXUtils.sqrt('a^2 + b^2'))),
              ConicPropertyWidget('${TeXUtils.plainText('Distance from ')}(x_1,y_1)', TeXUtils.frac('|ax_1 + by_2 + c|', TeXUtils.sqrt('a^2 + b^2'))),
            ],
          ),
          SizedBox(height: 10),
          Divider(),
          SizedBox(height: 10),
          Text('Different Forms of Lines:', style: TextStyle(fontSize: 17)),
          SizedBox(height: 10),
          NumberedColumnWidget(
            children: [
              ConicDifferentFormsWidget(words: [EquationWidget(TeXUtils.plainText('General Form'))], equation: 'ax + by + c = 0'),
              ConicDifferentFormsWidget(words: [EquationWidget(TeXUtils.plainText('Standard Form'))], equation: 'ax + by = c'),
              ConicDifferentFormsWidget(
                words: [
                  ...'Point-Slope Form of line where the line passes through the point'.split(' ').map((e) => EquationWidget(TeXUtils.plainText(e))).toList(),
                  EquationWidget('(x_1, y_1)'),
                ],
                equation: 'ax + by + c = 0',
              ),
              ConicDifferentFormsWidget(
                words: [
                  ...'Slope-Intercept Form of line where the line has slope'.split(' ').map((e) => EquationWidget(TeXUtils.plainText(e))).toList(),
                  EquationWidget('m'),
                  ...'and has the intercept'.split(' ').map((e) => EquationWidget(TeXUtils.plainText(e))).toList(),
                  EquationWidget('c'),
                  ...'on y-axis'.split(' ').map((e) => EquationWidget(TeXUtils.plainText(e))).toList(),
                ],
                equation: 'y = mx + c',
              ),
              ConicDifferentFormsWidget(
                words: [
                  ...'Intercept Form of line where the line has an intercept'.split(' ').map((e) => EquationWidget(TeXUtils.plainText(e))).toList(),
                  EquationWidget('a'),
                  ...'on x axis and an intercept'.split(' ').map((e) => EquationWidget(TeXUtils.plainText(e))).toList(),
                  EquationWidget('b'),
                  ...'on y-axis'.split(' ').map((e) => EquationWidget(TeXUtils.plainText(e))).toList(),
                ],
                equation: '${TeXUtils.frac('x', 'a')} + ${TeXUtils.frac('y', 'b')} = 1',
              ),
              ConicDifferentFormsWidget(
                words: [
                  ...'Two-Point Form of line where the line passes through points'.split(' ').map((e) => EquationWidget(TeXUtils.plainText(e))).toList(),
                  EquationWidget('(x_1, y_1)'),
                  ...'and'.split(' ').map((e) => EquationWidget(TeXUtils.plainText(e))).toList(),
                  EquationWidget('(x_2, y_2)'),
                ],
                equation: 'y = (${TeXUtils.frac('x_1 - x_2', 'y_1 - y_2')})(x - x_2) + y_2',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
