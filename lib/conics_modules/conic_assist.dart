import 'dart:math';

import 'package:conics_master/conics_modules/conic_models.dart';
import 'package:conics_master/utils/tex_utils.dart';
import 'package:conics_master/widgets/conic_property_widget.dart';
import 'package:flutter/material.dart';

class ConicAssist {
  static double getDeterminant(QuadXYConic conic) {
    final a = conic.x2;
    final b = conic.y2;
    final c = conic.c;
    final f = conic.y / 2;
    final g = conic.x / 2;
    final h = conic.xy / 2;
    return a * b * c + 2 * f * g * h - a * f * f - b * g * g - c * h * h;
  }

  static ConicTypes getConicType(QuadXYConic conic) {
    final a = conic.x2;
    final b = conic.y2;
    final c = conic.c;
    final f = conic.y / 2;
    final g = conic.x / 2;
    final h = conic.xy / 2;
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

  static String getConicTypeString(QuadXYConic conic) {
    final a = conic.x2;
    final b = conic.y2;
    final c = conic.c;
    final f = conic.y / 2;
    final g = conic.x / 2;
    final h = conic.xy / 2;
    final d = a * b * c + 2 * f * g * h - a * f * f - b * g * g - c * h * h;
    if (d == 0) {
      if (a * b - h * h == 0)
        return 'Straight Line';
      else
        return 'Pair Of Lines';
    } else {
      if (h == 0 && a == b)
        return 'Circle';
      else if (a * b - h * h == 0)
        return 'Parabola';
      else if (a * b - h * h > 0)
        return 'Ellipse';
      else
        return 'Hyperbola';
    }
  }

  static List<Widget> getProperties(QuadXYConic conic) {
    final conicType = getConicType(conic);
    switch (conicType) {
      case ConicTypes.straightLine:
        return [
          ConicPropertyWidget(
            TeXUtils.plainText('Slope'),
            'tan(${(atan2(-1 * conic.x, conic.y) / pi).toStringAsFixed(2)}\\pi) =  ${conic.y == 0 ? TeXUtils.infinity : (-1 * conic.x / conic.y).toStringAsFixed(2)}',
          ),
          ConicPropertyWidget(TeXUtils.plainText('x-intercept'), '${conic.x == 0 ? TeXUtils.infinity : ((-1 * conic.c / conic.x) * ((-1 * conic.c / conic.x) == 0.0 ? -1 : 1)).toStringAsFixed(2)}'),
          ConicPropertyWidget(TeXUtils.plainText('y-intercept'), '${conic.y == 0 ? TeXUtils.infinity : ((-1 * conic.c / conic.y) * ((-1 * conic.c / conic.y) == 0.0 ? -1 : 1)).toStringAsFixed(2)}'),
          ConicPropertyWidget('${TeXUtils.plainText('Distance from ')}(0, 0)', (conic.c / sqrt(pow(conic.x / 2, 2) + pow(conic.y / 2, 2))).toStringAsFixed(2)),
        ];
        break;
      case ConicTypes.circle:
        return [];
        break;
      case ConicTypes.ellipse:
        return [];
        break;
      case ConicTypes.hyperbola:
        return [];
        break;
      case ConicTypes.parabola:
        return [];
        break;
      case ConicTypes.pairOfLines:
        return [];
        break;
      default:
        return [];
    }
  }
}
