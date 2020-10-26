class TeXUtils {
  static const infinity = r'\infty';
  static const plus_minus = r'\pm';
  static const multiply_x = r'\times';
  static const div = r'\div';
  static const bottom_dots = r'\ldots';
  static const centered_dots = r'\cdots';
  static const lessThanEqualTo = r'\le';
  static const greaterThanEqualTo = r'\ge';
  static const notEqualTo = r'\ne';
  static const approx = r'\approx';
  static const degree = r'\degree';
  static const to = r'\to';
  static const composition = r'\circ';

  //-----------greek symbols----------------
  static const pi_small = r'\pi';
  static const pi_big = r'\Pi';
  static const alpha = r'\alpha';
  static const beta = r'\beta';
  static const chi = r'\chi';
  static const delta_big = r'\Delta';

  static String sup(String base, String expo) => '({$base})^{$expo}';
  static String sub(String base, String expo) => '({$base})_{$expo}';
  static String sqrt(String val, [String pow]) => '\\sqrt${pow == null ? '{$val}' : '[$pow]{$val}'}'; //error in pow
  static String frac(String n, String d) => '\\frac{$n}{$d}';
  static String log(String base, String val) => '\\log_{$base}$val';
}
