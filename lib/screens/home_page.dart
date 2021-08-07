import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_app_1/core/store.dart';
import 'package:flutter_app_1/models/cart_model.dart';
import 'dart:convert';
import 'package:flutter_app_1/models/catalogue.dart';
import 'package:flutter_app_1/utils/routes.dart';
import 'package:flutter_app_1/widgets/home_widgets/catalogue_header.dart';
import 'package:flutter_app_1/widgets/home_widgets/catalogue_list.dart';
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
    final _cart  = (VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder :(context,_) =>FloatingActionButton(onPressed: () => Navigator.pushNamed(context, Myroutes.cartRoute),
        backgroundColor: context.theme.buttonColor,
        child: Icon(CupertinoIcons.cart,color: Colors.white),
        ).badge(color: Vx.red400,size: 20,count: _cart.items.length),
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






