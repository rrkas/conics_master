import 'dart:math';

import 'package:conics_master/utils/ref_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home-screen';

  @override
  Widget build(BuildContext context) {
    final homeRoutings = [
      _HomeRouting(
        'Straight\nLines',
        Container(color: Colors.white, width: 2, height: 100, transform: Matrix4.rotationZ(-pi / 4), transformAlignment: FractionalOffset.center),
        () {},
      ),
      _HomeRouting(
        'Circle',
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(border: Border.all(color: Colors.white, width: 5), shape: BoxShape.circle),
        ),
        () {},
      ),
      _HomeRouting(
        'Ellipse',
        Container(
          width: 100,
          height: 50,
          decoration: BoxDecoration(border: Border.all(color: Colors.white, width: 5), borderRadius: BorderRadius.all(Radius.elliptical(100, 50))),
        ),
        () {},
      ),
      _HomeRouting(
        'Parabola',
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              width: 50,
              height: 100,
              transform: Matrix4.translationValues(0.0, 2.0, 0.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 5),
                borderRadius: BorderRadius.only(bottomLeft: Radius.elliptical(50, 100), bottomRight: Radius.elliptical(50, 100)),
              ),
            ),
            Container(
              height: 10,
              width: 150,
              decoration: BoxDecoration(color: Theme.of(context).accentColor, border: Border.all(color: Theme.of(context).accentColor, width: 10)),
            ),
          ],
        ),
        () {},
      ),
      _HomeRouting(
        'Hyperbola',
        Stack(
          alignment: Alignment.center,
          children: [
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 5),
                    borderRadius: BorderRadius.only(topRight: Radius.elliptical(100, 50), bottomRight: Radius.elliptical(100, 50)),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 5),
                    borderRadius: BorderRadius.only(topLeft: Radius.elliptical(100, 50), bottomLeft: Radius.elliptical(100, 50)),
                  ),
                ),
              ],
            ),
            Container(
              width: 110.5,
              height: 60,
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(color: Theme.of(context).accentColor, width: 8),
                  right: BorderSide(color: Theme.of(context).accentColor, width: 8),
                ),
              ),
            ),
          ],
        ),
        () {},
      ),
      _HomeRouting(
        'Pair Of Lines',
        Stack(
          children: [
            Container(color: Colors.white, width: 4, height: 100, transform: Matrix4.rotationZ(pi / 4), transformAlignment: FractionalOffset.center),
            Container(color: Colors.white, width: 2, height: 100, transform: Matrix4.rotationZ(-pi / 4), transformAlignment: FractionalOffset.center),
          ],
        ),
        () {},
      )
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(RefUtils.appName),
        actions: [
          IconButton(
            icon: Icon(Icons.menu_book),
            onPressed: () {},
          ),
          IconButton(
            icon: Text('=', style: TextStyle(fontSize: 40, color: Colors.white)),
            onPressed: () {},
          ),
        ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 5, mainAxisSpacing: 5),
        itemCount: homeRoutings.length,
        itemBuilder: (ctx, idx) => GestureDetector(
          onTap: homeRoutings[idx].onClick,
          child: Card(
            color: Theme.of(context).accentColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(child: Center(child: FittedBox(child: homeRoutings[idx].icon))),
                  FittedBox(
                    child: Text(
                      homeRoutings[idx].title,
                      style: GoogleFonts.adamina(fontSize: 18, color: Colors.white, letterSpacing: 1.1),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _HomeRouting {
  final String title;
  final Widget icon;
  final VoidCallback onClick;
  const _HomeRouting(this.title, this.icon, this.onClick);
}
