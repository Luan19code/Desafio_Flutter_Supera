import 'package:desafio_flutter_supera/model/products.dart';
import 'package:flutter/material.dart';

class Cart {
  final Product product;
  final int quantidade;
  final double price;

  Cart({
    @required this.product,
    @required this.quantidade,
    @required this.price,
  });
}
