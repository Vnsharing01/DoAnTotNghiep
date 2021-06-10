import 'package:flutter/cupertino.dart';
import 'package:yuru_camp/styles/color.dart';

class Styles {
  static TextStyle copyStyle({
    double fontSize,
    Color color,
    double height,
    FontWeight fontWeight,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 14,
      color: color ?? colorTvMain,
      height: height ?? 1.2,
      fontWeight: fontWeight ?? FontWeight.normal,
    );
  }
}
