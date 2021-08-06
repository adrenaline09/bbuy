import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:velocity_x/velocity_x.dart';

class CatalogueImage extends StatelessWidget {
  final String image;

  const CatalogueImage({Key? key, required this.image}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Image.network(image).box.roundedSM.p4.color(context.canvasColor).make().p12().w32(context);
  }
}