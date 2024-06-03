import 'package:flutter/painting.dart';

class Utilities {
  static EdgeInsets padding() {
    return const EdgeInsets.symmetric(
      horizontal: 24,
      vertical: 16,
    );
  }

  static EdgeInsets containerPadding() {
    return const EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 6,
    );
  }

  static Color colorRgboExtracter(List<int> color) {
    return Color.fromRGBO(color[0], color[1], color[2], 1);
  }
  static List<int> colorRgboCompressor(Color color) {
    return [color.red, color.green, color.blue];
  }
}
