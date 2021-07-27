class Items{

  final String  id;
  final String  name;
  final String  description;
  final num     price;
  final String  color;
  final String  imgUrl;

  Items({required this.id, required this.name, required this.description, required this.price, required this.color, required this.imgUrl});
}

final products = [Items(
  id: "m001",
  name: "iPhone 12 pro",
  description: " Apple iphone 12 pro 6/128 gb variant",
  price: 800,
  color: "#33505a",
  imgUrl: "https://fdn2.gsmarena.com/vv/pics/apple/apple-iphone-12-3.jpg"
)

];