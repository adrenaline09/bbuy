import 'package:flutter_app_1/models/catalogue.dart';

class CartModel{

    static final cartModel = CartModel._internal();
    
    CartModel._internal();

    factory CartModel() => cartModel; 

    late CatalogueModel _catalogue;

    final List<dynamic>  _itemIds = [];

   
    // get catalogue 
     // ignore: unnecessary_getters_setters
    CatalogueModel get catalogue => _catalogue;

    // ignore: unnecessary_getters_setters
    set catalogue(CatalogueModel newCatalogue){
      _catalogue  = newCatalogue;
    }

    // get items in the cart 
    List<Items> get items => _itemIds.map((id) => _catalogue.getById(id)).toList();

    // total price of cart
    num get totalPrice => items.fold(0, (total, current) => total+current.price);

    // add items to cart
    void add(Items item){
      _itemIds.add(item.id);
    }
    // remove items from cart
    void remove(Items item){
      _itemIds.remove(item.id);
    }

}