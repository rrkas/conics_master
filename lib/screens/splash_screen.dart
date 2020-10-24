import 'package:conics_master/screens/home_screen.dart';
import 'package:conics_master/utils/ref_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = '/splash-screen';

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3)).then((_) {
      try {
        Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
      } catch (e) {}
    });
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: FittedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FittedBox(
                          child: Text(
                            RefUtils.appName,
                            style: GoogleFonts.daysOne(
                              fontSize: 50,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Image.asset(
                          RefUtils.splash_img,
                          width: MediaQuery.of(context).size.width * 0.5,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Text(RefUtils.appVersion),
          ],
        ),
      ),
    );
  }
}
