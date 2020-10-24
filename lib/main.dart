import 'package:conics_master/screens/home_screen.dart';
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
      },
    );
  }
}
