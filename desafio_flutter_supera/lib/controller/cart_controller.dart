import 'package:desafio_flutter_supera/model/cart.dart';
import 'package:desafio_flutter_supera/model/products.dart';
import 'package:mobx/mobx.dart';

part 'cart_controller.g.dart';

class CartController = _CartController with _$CartController;

abstract class _CartController with Store {
  @observable
  ObservableMap<String, Cart> _cart = ObservableMap<String, Cart>();

  ObservableMap<String, Cart> get productsList {
    return {..._cart}.asObservable();
  }

  @action
  void clear() {
    _cart.clear();
  }

  int quantityProducts(Product product) {
    if (_cart.containsKey(product.id)) {
      return _cart[product.id].quantidade;
    }
    return null;
  }

  int get listSize {
    return _cart.length;
  }

  @action
  void addBuy(Product product) {
    if (_cart.containsKey(product.id)) {
      _cart.update(product.id, (existingItem) {
        return Cart(
          product: product,
          quantidade: existingItem.quantidade + 1,
          price: existingItem.price,
        );
      });
    } else {
      _cart.putIfAbsent(
        product.id,
        () => Cart(
          product: product,
          quantidade: 1,
          price: product.price,
        ),
      );
    }
  }

  @action
  void removeBuy(Product product) {
    if (_cart.containsKey(product.id)) {
      _cart.update(product.id, (existingItem) {
        Cart cart;

        cart = Cart(
          product: product,
          quantidade:
              existingItem.quantidade <= 0 ? 0 : existingItem.quantidade - 1,
          price: existingItem.price,
        );

        return cart;
      });
      if (_cart.containsKey(product.id) && _cart[product.id].quantidade <= 0) {
        _cart.remove(product.id);
      }
    }
  }
}
