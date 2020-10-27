import 'package:conics_master/conics_modules/conic_assist.dart';
import 'package:conics_master/conics_modules/conic_models.dart';
import 'package:conics_master/widgets/equation_widget.dart';
import 'package:conics_master/widgets/numbered_column_widget.dart';
import 'package:flutter/material.dart';

class AnalyzeScreen extends StatefulWidget {
  static const routeName = '/analyze-screen';

  @override
  _AnalyzeScreenState createState() => _AnalyzeScreenState();
}

class _AnalyzeScreenState extends State<AnalyzeScreen> {
  final x2 = TextEditingController(), y2 = TextEditingController(), xy = TextEditingController(), x = TextEditingController(), y = TextEditingController(), c = TextEditingController();
  final skey = GlobalKey<ScaffoldState>();
  bool showingResults = false;

  @override
  void initState() {
    x2.addListener(() => setState(() {}));
    y2.addListener(() => setState(() {}));
    xy.addListener(() => setState(() {}));
    x.addListener(() => setState(() {}));
    y.addListener(() => setState(() {}));
    c.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final x2text = '${x2.text}\\ x^2';
    final y2text = '${(double.tryParse(y2.text) ?? 0) >= 0 ? '\\ +\\ ${y2.text}' : '\\ ${y2.text}'}\\ y^2';
    final xytext = '${(double.tryParse(xy.text) ?? 0) >= 0 ? '\\ +\\ ${xy.text}' : '\\ ${xy.text}'}\\ xy';
    final xtext = '${(double.tryParse(x.text) ?? 0) >= 0 ? '\\ +\\ ${x.text}' : '\\ ${x.text}'}\\ x';
    final ytext = '${(double.tryParse(y.text) ?? 0) >= 0 ? '\\ +\\ ${y.text}' : '\\ ${y.text}'}\\ y';
    final ctext = '${(double.tryParse(c.text) ?? 0) >= 0 ? '\\ +\\ ${c.text}' : '\\ ${c.text}'}';
    QuadXYConic conic;
    if (showingResults) {
      conic = QuadXYConic(
        x2: double.parse(x2.text),
        y2: double.parse(y2.text),
        xy: double.parse(xy.text),
        x: double.parse(x.text),
        y: double.parse(y.text),
        c: double.parse(c.text),
      );
    }
    return Scaffold(
      key: skey,
      appBar: AppBar(
        title: Text('Analyze an Equation'),
        actions: [IconButton(icon: Icon(showingResults ? Icons.close : Icons.arrow_forward), onPressed: showResults)],
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: [
          if (!showingResults) ...[
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
            getRow(x2, false, 'x^2\\ (a)'),
            getRow(y2, false, 'y^2\\ (b)'),
            getRow(xy, false, 'xy\\ (2h)'),
            getRow(x, false, 'x\\ (2g)'),
            getRow(y, false, 'y\\ (2f)'),
            getRow(c, true, 'constant\\ (c)'),
          ],
          if (showingResults) ...[
            Center(
              child: FittedBox(
                child: Center(
                  child: EquationWidget('$x2text\\ $xytext\\ $y2text\\ $xtext\\ $ytext\\ $ctext\\ =\\ 0'),
                ),
              ),
            ),
            Divider(),
            Row(
              children: [
                Expanded(child: EquationWidget('\\Delta\\ =\\ ${ConicAssist.getDeterminant(conic).toStringAsFixed(2)}')),
                Expanded(child: Center(child: Text(ConicAssist.getConicTypeString(conic).toUpperCase(), style: TextStyle(fontWeight: FontWeight.bold)))),
              ],
            ),
            Divider(),
            NumberedColumnWidget(
              children: ConicAssist.getProperties(conic),
            )
          ],
        ],
      ),
    );
  }

  Widget getRow(TextEditingController tec, bool constant, String equation) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Row(
        children: [
          Expanded(
            child: Wrap(
              children: [
                if (!constant) Text('Coefficient of '),
                EquationWidget(equation),
              ],
            ),
          ),
          Expanded(
            child: TextFormField(
              controller: tec,
              decoration: getStandardInputDecoration(context).copyWith(
                hintText: '0.0',
                suffixIcon: showingResults ? Icon(Icons.check, color: Theme.of(context).primaryColor) : null,
              ),
              textAlign: TextAlign.right,
              style: TextStyle(color: Theme.of(context).primaryColor),
              keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
              enabled: !showingResults,
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration getStandardInputDecoration(BuildContext context, [bool invert = false]) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(width: 2, color: !invert ? Theme.of(context).primaryColor : Theme.of(context).scaffoldBackgroundColor),
    );
    final style = TextStyle(color: Theme.of(context).primaryColor);
    return InputDecoration(
      border: border,
      focusedBorder: border,
      disabledBorder: border,
      enabledBorder: border,
      errorBorder: border,
      focusedErrorBorder: border,
      fillColor: !invert ? Theme.of(context).primaryColor.withOpacity(0.1) : Theme.of(context).scaffoldBackgroundColor.withOpacity(0.9),
      filled: true,
      contentPadding: EdgeInsets.symmetric(horizontal: 10),
      counterStyle: style,
      suffixStyle: style,
      errorStyle: style,
      helperStyle: style,
      hintStyle: style,
      labelStyle: style,
      prefixStyle: style,
    );
  }

  bool checkValue(TextEditingController tec) {
    tec.text = tec.text.isEmpty ? '0.0' : tec.text;
    return double.tryParse(tec.text) == null ? false : true;
  }

  bool checkValues() => checkValue(x2) && checkValue(y2) && checkValue(xy) && checkValue(x) && checkValue(y) && checkValue(c);

  void showResults() {
    if (showingResults) {
      x2.clear();
      y2.clear();
      xy.clear();
      x.clear();
      y.clear();
      c.clear();
      setState(() => showingResults = false);
      return;
    }
    if (!checkValues()) {
      skey.currentState
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text('One or move values are invalid!')));
      return;
    }
    if (!checkAllNotZero()) {
      skey.currentState
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text('All values are ZERO!')));
      return;
    }
    setState(() => showingResults = true);
  }

  bool checkAllNotZero() =>
      double.parse(x2.text) != 0 && double.parse(y2.text) != 0 && double.parse(xy.text) != 0 && double.parse(x.text) != 0 && double.parse(y.text) != 0 && double.parse(c.text) != 0;
}
