import 'package:flutter/material.dart';
import 'package:flutter_app_1/models/cart_model.dart';
import 'package:flutter_app_1/models/catalogue.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatefulWidget {
  final Items catalogue;
  const AddToCart({
    Key? key,
    required this.catalogue,
  }) : super(key: key);

  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
     bool isInCart = _cart.items.contains(widget.catalogue);
    return ElevatedButton(
      onPressed: (){
       
        if(!isInCart) {
        isInCart = isInCart.toggle();
        final _catalogue = CatalogueModel();
        
        _cart.catalogue = _catalogue;
        _cart.add(widget.catalogue);
        setState(() { });
      }          
      }, 
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
        shape: MaterialStateProperty.all(StadiumBorder())
      ),
      child: isInCart?Icon(Icons.done):"Get".text.make());
  }
}