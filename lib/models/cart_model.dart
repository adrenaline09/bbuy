// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_app_1/core/store.dart';
import 'package:flutter_app_1/models/catalogue.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:velocity_x/velocity_x.dart';

class CartModel{
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


}

class AddMutation extends VxMutation<MyStore>{
  final Items item;

  AddMutation(this.item);
  @override
  perform() {
 store.cart._itemIds.add(item.id);
  }

}


class RemoveMutation extends VxMutation<MyStore>{
  final Items item;

  RemoveMutation(this.item);
  @override
  perform() {
 store.cart._itemIds.remove(item.id);
  }

}