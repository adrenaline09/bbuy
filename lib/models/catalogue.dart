class CatalogueModel{
static  List<Items> items = [Items(
  id: 1,
  name: "iPhone 12 pro",
  description: " Apple iphone 12 pro 128 GB",
  price: 80000,
  color: "#33505a",
  imgUrl: "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-12-family-select-2021?wid=940&hei=1112&fmt=jpeg&qlt=80&.v=1617135051000"
)];
}


class Items{

  final num  id;
  final String  name;
  final String  description;
  final num     price;
  final String  color;
  final String  imgUrl;

  Items({required this.id, required this.name, required this.description, required this.price, required this.color, required this.imgUrl});

  factory Items.fromJson(Map<String,dynamic> map){
    return Items(id : map["id"],
    name:        map["name"],
    description: map["description"],
    price:       map["price"],
    color:       map["color"],
    imgUrl:      map["imgUrl"]
    );

  }

  toJson()=>{
    "id":id,
    "name":name,
    "description":description,
    "price":price,
    "color":color,
    "imgUrl":imgUrl
  };

}

