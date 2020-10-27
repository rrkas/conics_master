//ax2 + 2hxy + by2 + 2gx + 2fy + c = 0

class QuadXYConic {
  double x2, xy, y2, x, y, c;
  QuadXYConic({this.x2 = 0, this.y2 = 0.0, this.c = 0, this.y = 0, this.x = 0, this.xy = 0});
}

enum ConicTypes { straightLine, circle, ellipse, hyperbola, parabola, pairOfLines }
