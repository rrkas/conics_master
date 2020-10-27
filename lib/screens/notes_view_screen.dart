import 'package:conics_master/screens/conic_detail_screens/circle_screen.dart';
import 'package:conics_master/screens/conic_detail_screens/ellipse_screen.dart';
import 'package:conics_master/screens/conic_detail_screens/hyperbola_screen.dart';
import 'package:conics_master/screens/conic_detail_screens/line_screen.dart';
import 'package:conics_master/screens/conic_detail_screens/pair_of_lines_screen.dart';
import 'package:conics_master/screens/conic_detail_screens/parabola_screen.dart';
import 'package:conics_master/utils/tex_utils.dart';
import 'package:conics_master/widgets/equation_widget.dart';
import 'package:flutter/material.dart';

class NotesViewScreen extends StatelessWidget {
  static const routeName = '/notes-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
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
                  'ax^2 + 2hxy + by^2 + 2gx + 2fy + c = 0',
                  style: TextStyle(fontSize: 20, color: Colors.indigo),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Divider(),
          SizedBox(height: 10),
          Text('STEP 1:\nFinding the discriminant:', style: TextStyle(fontSize: 17)),
          SizedBox(height: 5),
          Center(
            child: FittedBox(
              child: Center(child: EquationWidget('${TeXUtils.delta_big} = abc + 2fgh - af^2 - bg^2 - ch^2')),
            ),
          ),
          SizedBox(height: 10),
          Divider(),
          SizedBox(height: 10),
          Text('STEP 2:\nConditions:', style: TextStyle(fontSize: 17)),
          SizedBox(height: 5),
          equationConditionRow(context, '${TeXUtils.delta_big} = 0', 'ab - h^2 = 0', 'Straight Line', LineScreen.routeName),
          equationConditionRow(context, null, 'ab - h^2 ≠ 0', 'Pair of Lines', PairOfLinesScreen.routeName),
          SizedBox(height: 5),
          equationConditionRow(context, '${TeXUtils.delta_big} ≠ 0', 'h = 0 \\ and \\ a = b', 'Circle', CircleScreen.routeName),
          equationConditionRow(context, null, 'ab - h^2 = 0', 'Parabola', ParabolaScreen.routeName),
          equationConditionRow(context, null, 'ab - h^2 > 0', 'Ellipse', EllipseScreen.routeName),
          equationConditionRow(context, null, 'ab - h^2 < 0', 'Hyperbola', HyperbolaScreen.routeName),
        ],
      ),
    );
  }

  Widget equationConditionRow(BuildContext ctx, String eq1, String eq2, String name, String routeName) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(child: eq1 == null ? SizedBox() : Align(alignment: Alignment.centerLeft, child: FittedBox(child: EquationWidget(eq1)))),
          SizedBox(width: 5),
          Expanded(flex: 2, child: Align(alignment: Alignment.centerLeft, child: FittedBox(child: EquationWidget(eq2)))),
          SizedBox(width: 5),
          Expanded(
            flex: 2,
            child: InkWell(
              splashColor: Theme.of(ctx).accentColor,
              onTap: () => Navigator.of(ctx).pushNamed(routeName),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Theme.of(ctx).primaryColor,
                ),
                alignment: Alignment.center,
                child: Text(name, style: TextStyle(color: Colors.white, fontSize: 17), textAlign: TextAlign.center),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
