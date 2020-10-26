//ax2 + 2hxy + by2 + 2gx + 2fy + c = 0

class QuadXYConic {
  double a, h, b, g, f, c;
  QuadXYConic([this.a = 0, this.b = 0.0, this.c = 0, this.f = 0, this.g = 0, this.h = 0]);
}

class LineConic {
  double xIntercept, yIntercept, slopeFromPositiveXAxis, lengthOfPerpendicularFromOrigin;
}

enum ConicTypes { straightLine, circle, ellipse, hyperbola, parabola, pairOfLines }
