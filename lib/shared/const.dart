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
        3.0,
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
