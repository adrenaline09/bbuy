import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_app_1/models/catalogue.dart';
import 'package:flutter_app_1/widgets/drawer.dart';
import 'package:flutter_app_1/widgets/item_widget.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("Catalogue"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogueModel.items != null && CatalogueModel.items.isNotEmpty)?    ListView.builder(
          itemCount: CatalogueModel.items.length,
          itemBuilder: (context,index) =>
             ItemWidget(
              item: CatalogueModel.items[index],
            ), //start from here 3:52:25
        ):Center(
          child: CircularProgressIndicator(),
        ),
      ),
      drawer: MyDrawer(),
      ) ;
  }
}