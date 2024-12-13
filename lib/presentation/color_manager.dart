import 'package:flutter/material.dart';

class ColorManager {
  static Color primary =  HexColor.fromHex('#ED9728') ;
  static Color darkGrey =  HexColor.fromHex('#525252');
  static Color grey =  HexColor.fromHex('#737477');
  static Color lightGrey =  HexColor.fromHex('#9E9E9E');
}


extension HexColor on Color {
  static Color fromHex(String HexColorString) {
    HexColorString = HexColorString.replaceAll('#', '');

    if(HexColorString.length == 6) {
      HexColorString = 'FF' + HexColorString; // 8 char with opacity 100%
    }
    return Color(int.parse(HexColorString, radix: 16));
  }
}