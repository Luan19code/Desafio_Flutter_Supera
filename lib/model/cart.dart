import 'package:desafio_flutter_supera/model/products.dart';
import 'package:flutter/material.dart';

class Cart {
  String id;
  Product product;
  String title;
  int amount;
  double price;
  double shipping;

  Cart({
    @required this.id,
    @required this.product,
    @required this.title,
    @required this.amount,
    @required this.price,
    @required this.shipping,
  });
}
