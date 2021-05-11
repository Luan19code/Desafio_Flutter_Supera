import 'package:desafio_flutter_supera/model/products.dart';
import 'package:flutter/material.dart';

class Cart {
   Product product;
   int quantidade;
   double price;

  Cart({
    @required this.product,
    @required this.quantidade,
    @required this.price,
  });
}
