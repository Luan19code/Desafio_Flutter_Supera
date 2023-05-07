import 'package:desafio_flutter_supera/model/products.dart';
import 'package:flutter/material.dart';

void showToast(BuildContext context,
    {void Function(Product) function, Product product, String text}) {
  //Evitar que a snack fique uma em cima da outra
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  //
  //
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: Duration(seconds: 1),
      content: Text(
        text,
        textAlign: TextAlign.center,
      ),
      action: SnackBarAction(
          label: 'Desfazer',
          textColor: Colors.white,
          onPressed: () {
            function(product);
          }),
    ),
  );
}
