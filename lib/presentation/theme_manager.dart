
import 'package:flutter/material.dart';
import 'package:mvvm_project/presentation/color_manager.dart';
import 'package:mvvm_project/presentation/values_manager.dart';

ThemeData getApplicationTheme (){
  return ThemeData(
    // Main colors  of the app
    primaryColor: ColorManager.darkPrimary,
    primaryColorLight: ColorManager.primaryOpacity70,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,

    // card view theme 
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4
    )
  );
}