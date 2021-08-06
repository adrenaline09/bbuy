import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:velocity_x/velocity_x.dart';

class MyTheme{
  static ThemeData  lightTheme(BuildContext context) =>ThemeData(    
        // primarySwatch: Colors.black,   
        fontFamily: GoogleFonts.lato().fontFamily,
        cardColor: Colors.white,
        canvasColor: creamColor,
        buttonColor: darkBlue,
        accentColor: darkBlue,
        appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        textTheme: Theme.of(context).textTheme
        )
      );


  static ThemeData  darkTheme(BuildContext context) => ThemeData(
    brightness: Brightness.dark,
    fontFamily: GoogleFonts.lato().fontFamily,
    cardColor: Colors.black,
    canvasColor: darkColor,
    buttonColor: lightblue,
    accentColor: Colors.white,
        appBarTheme: AppBarTheme(
        color: Colors.black,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
        textTheme: Theme.of(context).textTheme.copyWith(
          headline6: 
          context.textTheme.headline6!.copyWith(color: Colors.white))
            
        )
  );



  //colors

  static Color  creamColor = Color(0xfff5f5f5);
  static Color  darkColor = Vx.gray900;

  static Color  darkBlue = Color(0xff403b58);
  static Color  lightblue = Vx.indigo500;

}