import 'package:flutter/material.dart';
import 'package:flutter_app_1/models/catalogue.dart';
import 'package:flutter_app_1/widgets/themes.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:velocity_x/velocity_x.dart';

class ProductDetails extends StatelessWidget {
  final Items catalogue;

  const ProductDetails({Key? key, required this.catalogue}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: MyTheme.darkBlue,
        child: ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    buttonPadding: Vx.mH0,
                    children: [
                      "₹${catalogue.price}".text.color(MyTheme.creamColor).semiBold.xl3.make(),
                      ElevatedButton(
                        onPressed: (){}, 
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(MyTheme.creamColor),
                          shape: MaterialStateProperty.all(StadiumBorder())
                        ),
                        child: "Get".text.xl.color(MyTheme.darkBlue).make()).w20(context)
                    ],
                  ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalogue.id.toString()),
              child: Image.network(catalogue.imgUrl).h40(context)
            ).h40(context),
            Expanded(
              child: VxArc(
                height: 35,
                arcType: VxArcType.CONVEX,
              edge: VxEdge.TOP,
                child: Container(
                color: MyTheme.darkBlue,
                width: context.screenWidth,
                child: Column(
                  children: [
                    catalogue.name.text.xl4.white.semiBold.make().py16(),
                    catalogue.description.text.white.xl.textStyle(context.captionStyle).make(),
                  ],
                ).py32(),
              ),
              ))
          ],
        )
      ),
      
    );
  }
}