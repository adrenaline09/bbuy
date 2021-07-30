import 'package:flutter/material.dart';
import 'package:flutter_app_1/screens/home_page.dart';
import 'package:flutter_app_1/screens/login_page.dart';
import 'package:flutter_app_1/utils/routes.dart';
import 'package:flutter_app_1/widgets/themes.dart';
void main()
{
  runApp(myApp());  
}

// ignore: camel_case_types
class myApp extends StatelessWidget {
  const myApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      themeMode: ThemeMode.light,
      theme:MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),



      debugShowCheckedModeBanner: false,

      initialRoute: Myroutes.homeRoute,
      routes:{
        "/": (context)=>LoginPage(),
        Myroutes.homeRoute:(context)=>Homepage(),
        "/login":(context)=>LoginPage(),  
      }, 
    );
  }
}