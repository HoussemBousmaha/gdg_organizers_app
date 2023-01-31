import 'package:flutter/material.dart';
import 'package:gdg_organizers_app/constants/const.dart';

class AppTheme {
  static ThemeData light() {
    return ThemeData(
        brightness: Brightness.light,
        shadowColor: Colors.black.withOpacity(0.05),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'OpenSans',
        dividerColor: Colors.black.withOpacity(0.05),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          foregroundColor: Colors.black,
          centerTitle: false,
          toolbarHeight: 70,
          iconTheme: IconThemeData(
            color: Colors.black,
            size: 24,
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: kBlue,
        ),
        iconTheme: const IconThemeData(
          color: kIconLightColor,
          size: 25,
        ),
        buttonTheme: const ButtonThemeData(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(kBlue),
            shape: MaterialStateProperty.all(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    kCornerButtonRadius,
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
