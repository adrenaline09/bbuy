import 'package:flutter/material.dart';
import 'package:flutter_app_1/widgets/themes.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:velocity_x/velocity_x.dart';

class CatalogueImage extends StatelessWidget {
  final String image;

  const CatalogueImage({Key? key, required this.image}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Image.network(image).box.roundedSM.p4.color(MyTheme.creamColor).make().p12().w32(context);
  }
}