import 'package:flutter/material.dart';

class ColorManager {

  static Color primary =  HexColor.fromHex('#ED9728') ;
  static Color darkGrey =  HexColor.fromHex('#525252');
  static Color grey =  HexColor.fromHex('#737477');
  static Color lightGrey =  HexColor.fromHex('#9E9E9E');
  static Color primaryOpacity70 =  HexColor.fromHex('#B3ED9728');


  // New colors 
  static Color darkPrimary =  HexColor.fromHex('#d17d11');
  static Color grey1 =  HexColor.fromHex('#d17d11');
  static Color grey2 =  HexColor.fromHex('#797979');
  static Color white =  HexColor.fromHex('#FFFFFF');
  static Color error =  HexColor.fromHex('#e61f34'); // red color

}


extension HexColor on Color {
  static Color fromHex(String HexColorString) {
    HexColorString = HexColorString.replaceAll('#', '');

    if(HexColorString.length == 6) {
      HexColorString = 'FF$HexColorString'; // 8 char with opacity 100%
    }
    return Color(int.parse(HexColorString, radix: 16));
  }
}