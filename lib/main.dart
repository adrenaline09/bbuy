import 'package:flutter/material.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_app_1/core/store.dart';
import 'package:flutter_app_1/screens/cart_page.dart';
import 'package:flutter_app_1/screens/home_page.dart';
import 'package:flutter_app_1/screens/login_page.dart';
import 'package:flutter_app_1/utils/routes.dart';
import 'package:flutter_app_1/widgets/themes.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:velocity_x/velocity_x.dart';

void main()
{
  runApp(VxState(
    store: MyStore(),
    child: myApp()));  
}

// ignore: camel_case_types
class myApp extends StatelessWidget {
  const myApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      themeMode: ThemeMode.system,
      theme:MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),



      debugShowCheckedModeBanner: false,

      initialRoute: Myroutes.loginRoute,
      routes:{
        "/": (context)=>LoginPage(),
        Myroutes.homeRoute:(context)=>Homepage(),
        Myroutes.loginRoute:(context)=>LoginPage(),
        Myroutes.cartRoute:(context)=>CartPage(),  
      }, 
    );
  }
}