import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_app_1/core/store.dart';
import 'package:flutter_app_1/models/cart_model.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make().centered()
      ),
      

      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "₹ ${_cart.totalPrice}".text.color(context.theme.accentColor).xl3.make(),
          30.widthBox,
          ElevatedButton(
            onPressed:(){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: "This is a Bugg :))".text.make()));
            },
            child: "Buy".text.white.make(),
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(context.theme.buttonColor)),
            ).w24(context)
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty?"Your cart is empty".text.xl3.makeCentered():ListView.builder(
      itemCount: _cart.items.length,
      itemBuilder: (context,index) => ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(
          icon: Icon(Icons.remove_circle_outline_outlined),
          onPressed: (){
            _cart.remove(_cart.items[index]);
            // setState(() {});           
          },
      ),
      title: _cart.items[index].name.text.make(),
    )
    );
  }
}