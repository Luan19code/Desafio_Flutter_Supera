import 'dart:math';

import 'package:desafio_flutter_supera/model/cart.dart';
import 'package:desafio_flutter_supera/model/products.dart';
import 'package:mobx/mobx.dart';

part 'cart_controller.g.dart';

class CartController = _CartController with _$CartController;

abstract class _CartController with Store {
  @observable
  ObservableMap<String, Cart> _cart = ObservableMap<String, Cart>();

  ObservableMap<String, Cart> get cartList {
    return {..._cart}.asObservable();
  }

  @action
  void clear() {
    _cart.clear();
  }

  double get totalAmount {
    double total = 0.0;
    _cart.forEach((key, cartItem) {
      total += cartItem.price * cartItem.amount;
    });
    return total;
  }

  String get totalShipping {
    double total = 0.0;
    _cart.forEach((key, cartItem) {
      total += cartItem.shipping;
    });
    if (totalAmount > 250) {
      return "Frete Gratis";
    }
    return "R\$ " + total.toStringAsFixed(2) + " Frete";
  }

  String amountOfProduct(Cart cart) {
    int total = 0;
    _cart.forEach((key, cartItem) {
      if (cart.id == cartItem.id) {
        total = cartItem.amount;
      }
    });
    return total.toString();
  }

  String totalOfProduct(Cart cart) {
    double total = 0.0;
    _cart.forEach((key, cartItem) {
      if (cart.id == cartItem.id) {
        total = cartItem.price * cartItem.amount;
      }
    });
    return total.toStringAsFixed(2);
  }

  int quantityProducts(Product product) {
    if (_cart.containsKey(product.id)) {
      return _cart[product.id].amount;
    }
    return null;
  }

  String idProduct(Cart cart) {
    String total;
    _cart.forEach((key, cartItem) {
      if (cart.id == cartItem.id) {
        total = cartItem.product.id;
      }
    });
    return total.toString();
  }

  int get listSize {
    return _cart.length;
  }

  @action
  void addBuy(Product product) {
    if (_cart.containsKey(product.id)) {
      _cart.update(product.id, (existingItem) {
        return Cart(
          id: existingItem.id,
          title: product.name,
          product: product,
          amount: existingItem.amount + 1,
          price: existingItem.price,
          shipping: existingItem.shipping + 10,
        );
      });
    } else {
      _cart.putIfAbsent(
        product.id,
        () => Cart(
          id: Random().nextDouble().toString(),
          title: product.name,
          product: product,
          amount: 1,
          price: product.price,
          shipping: 10,
        ),
      );
    }
  }

  @action
  void removeBuy(Product product) {
    print(product.name + product.name);
    if (_cart.containsKey(product.id)) {
      _cart.update(product.id, (existingItem) {
        Cart cart;

        cart = Cart(
          id: existingItem.id,
          title: product.name,
          product: product,
          amount: existingItem.amount <= 0 ? 0 : existingItem.amount - 1,
          price: existingItem.price,
          shipping: existingItem.shipping - 10,
        );

        return cart;
      });
      if (_cart.containsKey(product.id) && _cart[product.id].amount <= 0) {
        print(product.name);
        removeList(product);
      }
    }
  }

  @action
  void removeList(Product product) {
    _cart.removeWhere((key, value) => value.product.id == product.id);
  }

  @action
  void removeAll() {
    _cart.clear();
  }
}
