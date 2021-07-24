import 'package:flutter/material.dart';
import 'package:flutter_app_1/widgets/drawer.dart';

class Homepage extends StatelessWidget {
  const Homepage({ Key? key }) : super(key: key);
  final int days = 30;
  final String name = "Mudit";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("Catalogue"),
      ),
      body: Center(
          child: Container(
            child: Text("Welcome to $days days flutter course with $name"),
          ),
        ),
      drawer: MyDrawer(),
      ) ;
  }
}