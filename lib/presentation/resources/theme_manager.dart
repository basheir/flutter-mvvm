
import 'package:flutter/material.dart';
import 'package:mvvm_project/presentation/resources/color_manager.dart';
import 'package:mvvm_project/presentation/resources/font_manager.dart';
import 'package:mvvm_project/presentation/resources/style_manager.dart';
import 'package:mvvm_project/presentation/resources/values_manager.dart';

ThemeData getApplicationTheme (){
  return ThemeData(
    // Main colors  of the app
    primaryColor: ColorManager.darkPrimary,
    primaryColorLight: ColorManager.primaryOpacity70,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    // ripple color
    splashColor: ColorManager.grey,

    // card view theme 
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4
    ),

    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primary,
      elevation: AppSize.s4,
      shadowColor: ColorManager.primaryOpacity70,
      titleTextStyle: getRegularStyle(color: ColorManager.white, fontSize: FontSize.s16)
    ),
    buttonTheme: ButtonThemeData(
      shape: StadiumBorder(),
      disabledColor: ColorManager.grey1,
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.primaryOpacity70
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(color: ColorManager.white),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.s12) ),
        backgroundColor: ColorManager.primary
        
      )
    ),

    // Text theme
    textTheme: TextTheme(
      headlineSmall: getSemiBoldStyle(color: ColorManager.darkGrey, fontSize: FontSize.s16),
      headlineMedium: getMediumStyle(color: ColorManager.grey),
      bodySmall: getRegularStyle(color: ColorManager.grey1),
      bodyLarge: getRegularStyle(color: ColorManager.primary),
      bodyMedium: getRegularStyle(color: ColorManager.grey)
    ),

  // Input decoration theme (text form field)
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: EdgeInsets.all(AppPadding.p8),

    // hint style
    hintStyle: getMediumStyle(color: ColorManager.grey1),

    // label style
    labelStyle: getMediumStyle(color: ColorManager.darkGrey),

    // error style
    errorStyle: getRegularStyle(color: ColorManager.error),

    // enabled border
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
      borderRadius: BorderRadius.all(Radius.circular(AppSize.s8),),
    ),

    // focused border
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
      borderRadius: BorderRadius.all(Radius.circular(AppSize.s18),),
    ),

    // error border
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1_5),
      borderRadius: BorderRadius.all(Radius.circular(AppSize.s18),),
    ),

    // focused error border
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
      borderRadius: BorderRadius.all(Radius.circular(AppSize.s18),),
    ),
    
  )
  );

  // app bar theme
}