import 'package:flutter/material.dart';
import 'package:flutter_app_1/models/catalogue.dart';
import 'package:flutter_app_1/widgets/home_widgets/add_to_cart.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:velocity_x/velocity_x.dart';

class ProductDetails extends StatelessWidget {
  final Items catalogue;

  const ProductDetails({Key? key, required this.catalogue}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.transparent,),
        
        backgroundColor: context.canvasColor,
        bottomNavigationBar: Container(
          color: context.cardColor,
          child: ButtonBar(
                      alignment: MainAxisAlignment.spaceBetween,
                      buttonPadding: Vx.mH0,
                      children: [
                        "₹${catalogue.price}".text.color(context.accentColor).semiBold.xl3.make(),
                        AddToCart(catalogue: catalogue)
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
                    color: context.cardColor,
                    width: context.screenWidth,
                    child: Column(
                      children: [
                        catalogue.name.text.xl4.color(context.accentColor).semiBold.make().py16(),
                        catalogue.description.text.white.xl.textStyle(context.captionStyle).make(),
                        "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Donec pede justo.".text.make().p16()
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