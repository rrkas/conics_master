import 'package:conics_master/conics_modules/quad_xy_conic.dart';

class DetectConic {
  static ConicTypes getConicType(QuadXYConic conic) {
    final a = conic.a;
    final b = conic.b;
    final c = conic.c;
    final f = conic.f;
    final g = conic.g;
    final h = conic.h;
    final d = a * b * c + 2 * f * g * h - a * f * f - b * g * g - c * h * h;
    if (d == 0) {
      if (a * b - h * h == 0)
        return ConicTypes.straightLine;
      else
        return ConicTypes.pairOfLines;
    } else {
      if (h == 0 && a == b)
        return ConicTypes.circle;
      else if (a * b - h * h == 0)
        return ConicTypes.parabola;
      else if (a * b - h * h > 0)
        return ConicTypes.ellipse;
      else
        return ConicTypes.hyperbola;
    }
  }
}
