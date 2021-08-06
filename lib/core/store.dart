// @dart=2.9

// ignore: import_of_legacy_library_into_null_safe
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_app_1/models/cart_model.dart';
import 'package:flutter_app_1/models/catalogue.dart';

class MyStore extends VxStore {
  CatalogueModel catalogue;
  CartModel cart;


  MyStore() 
  {
    catalogue = CatalogueModel();
    cart = CartModel();
    cart.catalogue = catalogue;
  }
}
