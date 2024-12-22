import 'package:flutter/material.dart';
import 'package:online_clothing/resources/styles_manager.dart';
import 'package:online_clothing/resources/values_manager.dart';
import 'color_manager.dart';
import 'font_manager.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: ColorsManager.white,
    colorScheme: const ColorScheme.light().copyWith(
      surface: ColorsManager.whiteMore,
      onSurface: ColorsManager.white,

    ),

    //main colors theme
    primaryColor: ColorsManager.primary,
    disabledColor: ColorsManager.gray,
    splashColor: ColorsManager.lightPrimary,

    //drawer theam
    drawerTheme: DrawerThemeData(
        backgroundColor:ColorsManager.white
    ),
    //cardview theme
    cardTheme: CardTheme(
      color: ColorsManager.white,
      shadowColor: ColorsManager.gray,
      elevation: AppSize.s4,
    ),

    //AppBar theme
    appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: ColorsManager.white),
        color: ColorsManager.primary,
        elevation: AppSize.s4,
        shadowColor: ColorsManager.lightPrimary,
        centerTitle: true,
        titleTextStyle: getRegularStyle(
            fontSize: FontSize.s16, color: ColorsManager.white)),

    //button theme
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorsManager.lightGray,
      buttonColor: ColorsManager.primary,
      splashColor: ColorsManager.lightPrimary,
    ),

    //elevated theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle:
            getRegularStyle(color: ColorsManager.white, fontSize: FontSize.s18),
        // primary: ColorsManager.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
      ),
    ),

    //Text theme
    textTheme: TextTheme(
      displayLarge: getBoldStyle(color: ColorsManager.darkGray, fontSize: FontSize.s16),
      displayMedium: getLightStyle(color: ColorsManager.darkGray, fontSize: FontSize.s16),
      displaySmall: getLightStyle(color: ColorsManager.darkGray, fontSize: FontSize.s16),

      headlineLarge: getSimpoldStyle(color: ColorsManager.darkGray, fontSize: FontSize.s16,),

      headlineMedium: getRegularStyle(color: ColorsManager.white, fontSize: FontSize.s12,),

      titleLarge: getRegularStyle(color: ColorsManager.primary),
      titleMedium: getMedumStyle(color: ColorsManager.primary, fontSize: FontSize.s16),
      titleSmall: getRegularStyle(color: ColorsManager.darkGray),

      bodyLarge: getRegularStyle(color: ColorsManager.lightGray),
      bodyMedium: getRegularStyle(color: ColorsManager.darkGray),
      bodySmall: getRegularStyle(color: ColorsManager.darkGray),
    ),


    //inputDecoration theme
    inputDecorationTheme: InputDecorationTheme(
      //content padding
      contentPadding: const EdgeInsets.all(AppPadding.p8),

      //hint style
      hintStyle:
          getRegularStyle(color: ColorsManager.gray, fontSize: FontSize.s14),

      //label style
      labelStyle:
          getRegularStyle(color: ColorsManager.gray, fontSize: FontSize.s14),

      fillColor: ColorsManager.lightGray200,
      //error style
      errorStyle: getRegularStyle(color: ColorsManager.error),

      //enable border style
      enabledBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorsManager.primary, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),

      //focused border style
      focusedBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorsManager.primary, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),

      //error border style
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorsManager.error, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),

      //focused error border style
      focusedErrorBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorsManager.primary, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
    ),

      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          // اللون الرئيسي
          foregroundColor: WidgetStateProperty.all(ColorsManager.gray),
        ),
      )



  );

  static final darkTheme = ThemeData(
      useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: ColorsManager.lightBlack,

    colorScheme: const ColorScheme.dark().copyWith(
      surface: ColorsManager.whiteMore,
      onSurface: ColorsManager.lightBlack,
    ),

    //main colors theme
    primaryColor: ColorsManager.primary,
    disabledColor: ColorsManager.gray,
    splashColor: ColorsManager.lightPrimary,

    //drawer theam
    drawerTheme: DrawerThemeData(
        backgroundColor:ColorsManager.lightBlack
    ),
    //cardview theme
    cardTheme: CardTheme(
      color: ColorsManager.white,
      shadowColor: ColorsManager.gray,
      elevation: AppSize.s4,
    ),

    //AppBar theme
    appBarTheme: AppBarTheme(
        iconTheme:IconThemeData(color: ColorsManager.white),
        color: ColorsManager.primary,
        elevation: 0,
        shadowColor: ColorsManager.lightPrimary,
        centerTitle: true,
        titleTextStyle: getRegularStyle(
            fontSize: FontSize.s16, color: ColorsManager.white)),

    //button theme
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorsManager.lightGray,
      buttonColor: ColorsManager.primary,
      splashColor: ColorsManager.lightPrimary,
    ),

    //elevated theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(color: ColorsManager.white, fontSize: FontSize.s18),
        // primary: ColorsManager.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
      ),
    ),

    //Text theme
    textTheme: TextTheme(
      displayLarge: getBoldStyle(color: ColorsManager.darkGray, fontSize: FontSize.s16),
      displayMedium: getLightStyle(color: ColorsManager.darkGray, fontSize: FontSize.s16),
      displaySmall: getLightStyle(color: ColorsManager.darkGray, fontSize: FontSize.s16),
      headlineLarge: getSimpoldStyle(color: ColorsManager.lightGray, fontSize: FontSize.s16,),
      headlineMedium: getRegularStyle(color: ColorsManager.white, fontSize: FontSize.s12,),
      titleLarge: getRegularStyle(color: ColorsManager.primary),
      titleMedium: getMedumStyle(color: ColorsManager.primary, fontSize: FontSize.s16),
      titleSmall: getRegularStyle(color: ColorsManager.white),
      bodyLarge: getRegularStyle(color: ColorsManager.lightGray),
      bodyMedium: getRegularStyle(color: ColorsManager.darkGray),
      bodySmall: getRegularStyle(color: ColorsManager.white),
    ),

    //inputDecoration theme
    inputDecorationTheme: InputDecorationTheme(
      //content padding
      contentPadding: const EdgeInsets.all(AppPadding.p8),

      iconColor: ColorsManager.lightBlack,

      //hint style
      hintStyle:
          getRegularStyle(color: ColorsManager.gray, fontSize: FontSize.s14),

      //label style
      labelStyle:
          getRegularStyle(color: ColorsManager.gray, fontSize: FontSize.s14),

      fillColor: ColorsManager.lightGray200,
      //error style
      errorStyle: getSimpoldStyle(color: ColorsManager.error),

      //enable border style
      enabledBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorsManager.primary, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),

      //focused border style
      focusedBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorsManager.primary, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),

      //error border style
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorsManager.error, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),

      //focused error border style
      focusedErrorBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorsManager.primary, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
    ),

       iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          // اللون الرئيسي
          foregroundColor: WidgetStateProperty.all(ColorsManager.gray),
        ),
      )


  );
}