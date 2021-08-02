import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_app_1/models/catalogue.dart';
import 'package:flutter_app_1/widgets/drawer.dart';
import 'package:flutter_app_1/widgets/item_widget.dart';
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
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32, 
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start  ,
            children: [
              CatalogueHeader(),
            if(CatalogueModel.items.isNotEmpty)
              CatalogueList().expand()
            else
              Center(child: CircularProgressIndicator(),)
               
            ],            
          ),
        ),
      )
    );
  }
}
class CatalogueHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start  ,
            children: [
              "Catalogue App".text.xl4.bold.color(MyTheme.darkBlue).make(),
              "Most Viewed Products".text.xl2.make() 
            ],
    );
  }
}

class CatalogueList extends StatelessWidget {
  const CatalogueList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogueModel.items.length ,
      itemBuilder: (context, index){
        final catalogue = CatalogueModel.items[index];
        return CatalogueItem(catalogue: catalogue);
      },
    );
  }
}


class CatalogueItem extends StatelessWidget {

  final Items catalogue;
  const CatalogueItem({key, required this.catalogue })
  :super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        
        children: [
          CatalogueImage(image: catalogue.imgUrl),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalogue.name.text.color(MyTheme.darkBlue).semiBold.make().py16(),
                catalogue.description.text.textStyle(context.captionStyle).make(),
                10.heightBox,
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: Vx.mH0,
                  children: [
                    "₹${catalogue.price}".text.bold.xl.make(),
                    ElevatedButton(
                      onPressed: (){}, 
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(MyTheme.darkBlue),
                        shape: MaterialStateProperty.all(StadiumBorder())
                      ),
                      child: "Get".text.make())
                  ],
                ).pOnly(right: 10)
              ],
            )
          )
        ],
      )
    ).white.roundedLg.square(150).make().py12();
  }
}

class CatalogueImage extends StatelessWidget {
  final String image;

  const CatalogueImage({Key? key, required this.image}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Image.network(image).box.roundedSM.p4.color(MyTheme.creamColor).make().p12().w32(context);
  }
}