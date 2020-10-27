import 'package:conics_master/screens/analyze_screen.dart';
import 'package:conics_master/screens/conic_detail_screens/circle_screen.dart';
import 'package:conics_master/screens/conic_detail_screens/ellipse_screen.dart';
import 'package:conics_master/screens/conic_detail_screens/hyperbola_screen.dart';
import 'package:conics_master/screens/conic_detail_screens/line_screen.dart';
import 'package:conics_master/screens/conic_detail_screens/pair_of_lines_screen.dart';
import 'package:conics_master/screens/conic_detail_screens/parabola_screen.dart';
import 'package:conics_master/screens/home_screen.dart';
import 'package:conics_master/screens/notes_view_screen.dart';
import 'package:conics_master/screens/splash_screen.dart';
import 'package:conics_master/widgets/fade_route_transition.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {TargetPlatform.android: FadeTransitionPageBuilder(), TargetPlatform.iOS: FadeTransitionPageBuilder()},
        ),
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.indigo,
        accentColor: Colors.green.shade500,
        appBarTheme: AppBarTheme(elevation: 0.0),
      ),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (_) => SplashScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
        NotesViewScreen.routeName: (_) => NotesViewScreen(),
        AnalyzeScreen.routeName: (_) => AnalyzeScreen(),
        //----------------------------------------------------
        LineScreen.routeName: (_) => LineScreen(),
        PairOfLinesScreen.routeName: (_) => PairOfLinesScreen(),
        CircleScreen.routeName: (_) => CircleScreen(),
        ParabolaScreen.routeName: (_) => ParabolaScreen(),
        EllipseScreen.routeName: (_) => EllipseScreen(),
        HyperbolaScreen.routeName: (_) => HyperbolaScreen(),
      },
    );
  }
}
