import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_app_1/core/store.dart';
import 'package:flutter_app_1/models/cart_model.dart';
import 'package:flutter_app_1/models/catalogue.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Items catalogue;
   AddToCart({
    Key? key,
    required this.catalogue,
  }) : super(key: key);


  
  @override
  Widget build(BuildContext context) {
    VxState.listen(context,to: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
     bool isInCart = _cart.items.contains(catalogue);
    return ElevatedButton(
      onPressed: (){
       
        if(!isInCart) {

        AddMutation(catalogue);
      }          
      }, 
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
        shape: MaterialStateProperty.all(StadiumBorder())
      ),
      child: isInCart?Icon(Icons.done):"Get".text.make());
  }
}