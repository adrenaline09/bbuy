import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({ Key? key }) : super(key: key);
  final int days = 30;
  final String name = "Mudit";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalogue"),
      ),
      body: Center(
          child: Container(
            child: Text("Welcome to $days days flutter course with $name"),
          ),
        ),
      drawer: Drawer(),
      ) ;
  }
}