class Product {

  int id;
  String name;
  double price;
  int score;
  String image;

  Product({this.id, this.name, this.price, this.score, this.image});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    score = json['score'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['score'] = this.score;
    data['image'] = this.image;
    return data;
  }
}
