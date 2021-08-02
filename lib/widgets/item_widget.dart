import 'package:flutter/material.dart';
import 'package:flutter_app_1/models/catalogue.dart';


class ItemWidget extends StatelessWidget {

  final Items item;

  const ItemWidget({Key? key, required this.item}) 
  : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      
      child: ListTile(
        leading: Image.network(item.imgUrl),
        title: Text(item.name),
        subtitle: Text(item.description),
        
        trailing: Text(
          "₹${item.price}",
          textScaleFactor: 1.5,
          style: TextStyle(
          color: Colors.deepPurple,
            
          ),
        ),  //getting error while loading network image ;3:58:12
      ),
    );
  }
}