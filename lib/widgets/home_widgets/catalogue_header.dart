import 'package:flutter/material.dart';
import 'package:flutter_app_1/widgets/themes.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:velocity_x/velocity_x.dart';

class CatalogueHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start  ,
            children: [
              "Catalogue App".text.xl4.bold.color(context.theme.accentColor).make(),
              "Most Viewed Products".text.xl2.make() 
            ],
    );
  }
}