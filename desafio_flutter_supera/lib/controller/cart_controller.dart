import 'package:desafio_flutter_supera/model/cart.dart';
import 'package:mobx/mobx.dart';

part 'cart_controller.g.dart';

class CartController = _CartController with _$CartController;

abstract class _CartController with Store {
  @observable
  ObservableList<Cart> _cart = ObservableList<Cart>();

  ObservableList<Cart> get productsList => [..._cart].asObservable();


  




}
