import 'package:flutter/material.dart';
import 'package:flutter_app_1/models/catalogue.dart';
import 'package:flutter_app_1/screens/home_page_details.dart';
import 'package:flutter_app_1/widgets/home_widgets/catalogue_image.dart';
import 'package:flutter_app_1/widgets/themes.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:velocity_x/velocity_x.dart';

class CatalogueList extends StatelessWidget {
  const CatalogueList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogueModel.items.length ,
      itemBuilder: (context, index){
        final catalogue = CatalogueModel.items[index];
        return InkWell(
          onTap:() => Navigator.push(
            context, MaterialPageRoute(
              builder: (context)=>ProductDetails(catalogue: catalogue))) ,
          child: CatalogueItem(catalogue: catalogue),);
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
          Hero(
            tag: Key(catalogue.id.toString()),
            child: CatalogueImage(image: catalogue.imgUrl)),
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