  import 'package:flutter/material.dart';
import 'package:flutter_app_1/models/catalogue.dart';
import 'package:flutter_app_1/widgets/drawer.dart';
import 'package:flutter_app_1/widgets/item_widget.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: CatalogueModel.items.length,
          itemBuilder: (context,index){
            return ItemWidget(
              item: CatalogueModel.items[index],
            );  //start from here 3:52:25
          },
        ),
      ),
      drawer: MyDrawer(),
      ) ;
  }
}