import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_app_1/models/catalogue.dart';
import 'package:flutter_app_1/utils/routes.dart';
import 'package:flutter_app_1/widgets/home_widgets/catalogue_header.dart';
import 'package:flutter_app_1/widgets/home_widgets/catalogue_list.dart';
import 'package:flutter_app_1/widgets/themes.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:velocity_x/velocity_x.dart';
class Homepage extends StatefulWidget {
  const Homepage({ Key? key }) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final int days = 30;

  final String name = "Mudit";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
      final catalogueJson = await rootBundle.loadString("assets/files/catalogue.json");
      // print(catalogueJson);
      final decodeData = jsonDecode(catalogueJson);
      // print(decodeData);
      var productData = decodeData["products"];
      // print(productData);
      CatalogueModel.items = List.from(productData).map<Items>(
        (item) => Items.fromJson(item)).toList();
        setState(() { });
       
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: FloatingActionButton(onPressed: () => Navigator.pushNamed(context, Myroutes.cartRoute),
      backgroundColor: context.theme.buttonColor,
      child: Icon(CupertinoIcons.cart,color: Colors.white),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32, 
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start  ,
            children: [
              CatalogueHeader(),
            if(CatalogueModel.items.isNotEmpty)
              CatalogueList().py16().expand()
            else
              CircularProgressIndicator().centered().expand()
               
            ],            
          ),
        ),
      )
    );
  }
}






