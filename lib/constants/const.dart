import 'package:flutter/material.dart';

final kBoxDecorationForTask = BoxDecoration(
  borderRadius: BorderRadius.circular(5),
  gradient: const LinearGradient(colors: [
    Color(0xFF0D9D58),
    Color(0xFF4285F4),
    Color(0xFFFFCA32),
    Color(0xFFEA4334),
  ]),
);
const kBoxDecorationForEvents = BoxDecoration(
  boxShadow: [
    BoxShadow(
      color: Color(0xff4dea4334),
      blurRadius: 4,
      spreadRadius: 5.0,
      offset: Offset(
        0,
        2.0,
      ),
    )
  ],
  gradient: LinearGradient(colors: [
    Color(0xFF0D9D58),
    Color(0xFF4285F4),
    Color(0xFFFFCA32),
    Color(0xFFEA4334),
  ]),
);
const emaillinearGradient = LinearGradient(
  colors: [
    Color(0xFFEA4334),
    Color(0xFF0D9D58),
  ],
);
const passwordlinearGradient = LinearGradient(
  colors: [
    Color(0xFF4285F4),
    Color(0xFFFFCA32),
  ],
);
const kBoxDecorationForLogin = BoxDecoration(
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(20),
    topRight: Radius.circular(20),
  ),
  gradient: LinearGradient(
    colors: [
      Color(0xFFEA4334),
      Color(0xFF0D9D58),
      Color(0xFF4285F4),
      Color(0xFFFFCA32),
    ],
  ),
);
const String images = 'assets/images';
const String icons = 'assets/icons/';
const kGreen = Color(0xFF0D9D58);
const kBlue = Color(0xFF4285F4);
const kRed = Color(0xFFEA4334);
const kLightGrey = Color(0xfffafafa);
const kGrey = Color(0Xff757575);
const kYellow = Color(0xFFFFCA32);
const kTextLightColor = Color(0xff5A5A5F);
const kThinTextLightColor = Color(0xff9c9c9c);
const kIconLightColor = Color(0xff407056);
const kInputBorderLightColor = Color(0xffC4C4C4);
const kScaffoldLightBackgroundColor = Color(0xfff7f7f7);

const kCornerRadius = 25.0;
const kCornerInputRadius = 20.0;
const kCornerButtonRadius = 8.0;

const String uri = 'http://<IPV4>/api';
const String socketUri = "http://<IPV4>";
String? validateEmail(String? value) {
  String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern);
  if (value == null || value.isEmpty || !regex.hasMatch(value)) {
    return 'Enter Valid Email';
  } else {
    return null;
  }
}

String? validatePassword(String? value) {
  if (value == null) {
    return 'Please enter password';
  } else if (value.isEmpty) {
    return 'Please enter password';
  } else {
    if (value.length < 10) {
      return 'Password  must be of 10 character';
    } else {
      return null;
    }
  }
}
