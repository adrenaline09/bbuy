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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("Catalogue"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogueModel.items.isNotEmpty) //CatalogueModel.items != null &&
        ?GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15 ),
          itemBuilder:(context,index){
            final item = CatalogueModel.items[index];
            return Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              clipBehavior: Clip.antiAlias,
              child: GridTile(
                header:Container(
                    child: Text(
                      item.name,
                      style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold),
                    ),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(color: Colors.black),
                ),
                footer: Container(
                  child: Text(
                    item.price.toString(),
                    
                  ),
                  padding: EdgeInsets.all(8),
                ),
                child: Image.network(item.imgUrl))); //wrapping this with card widget
            },
          itemCount:CatalogueModel.items.length,
          )
        :Center(
          child: CircularProgressIndicator(),
        ),
      ),
      drawer: MyDrawer(),
      ) ;
  }
}