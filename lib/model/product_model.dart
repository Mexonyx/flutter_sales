class Product {
  num id;
  String title;
  String description;
  num price;
  String image;
  String category;

  Product(this.id, this.title,  this.price, this.description,  this.category, this.image);

  Product.fromJson(Map<String,dynamic> map)
      : id = map["id"],
        title = map["title"],
        price = map["price"],
        description = map["description"],
        category = map["category"],
        image = map["image"];

}