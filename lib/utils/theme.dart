import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData themeData = ThemeData(
  backgroundColor: Color(0xFFE8F0F2),
  primaryColor: Color(0xFF75BEFA),
  accentColor: Color(0xFF3C8EC7),
  textTheme: GoogleFonts.poppinsTextTheme(
    TextTheme(
      headline1: TextStyle(fontSize: 50),
      headline2: TextStyle(
          fontSize: 40, color: Colors.white, fontWeight: FontWeight.normal),
      headline3: TextStyle(
          fontSize: 18, color: Colors.white, fontWeight: FontWeight.normal),
      headline4: TextStyle(
          fontSize: 16, color: Colors.white, fontWeight: FontWeight.normal),
      headline5: TextStyle(
          fontSize: 14, color: Colors.black, fontWeight: FontWeight.normal),
      headline6: TextStyle(
          fontSize: 12, color: Colors.black, fontWeight: FontWeight.normal),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: EdgeInsets.all(8),
    fillColor: Colors.white,
    filled: true,
    // border: OutlineInputBorder(
    //   borderSide: BorderSide
    // ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(
        Color(0xFF75BEFA)
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  ),

  primaryIconTheme: IconThemeData(color: Colors.white),
  accentIconTheme:  IconThemeData(color: Color(0xFF3C8EC7))
  

);
