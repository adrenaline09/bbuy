import 'package:flutter/material.dart';
import 'package:flutter_app_1/screens/home_page.dart';
import 'package:flutter_app_1/screens/login_page.dart';
import 'package:flutter_app_1/utils/routes.dart';
import 'package:google_fonts/google_fonts.dart';
void main()
{
  runApp(myApp());  
}

class myApp extends StatelessWidget {
  const myApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      themeMode: ThemeMode.light,
      theme:ThemeData(       
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      debugShowCheckedModeBanner: true,
      routes:{
        "/": (context)=>LoginPage(),
        Myroutes.homeRoute:(context)=>Homepage(),
        "/login":(context)=>LoginPage(),  
      }, 
    );
  }
}