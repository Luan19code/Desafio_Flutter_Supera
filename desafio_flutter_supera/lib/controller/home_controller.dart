import 'package:desafio_flutter_supera/data/information.dart';
import 'package:desafio_flutter_supera/model/products.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  @observable
  ObservableList<Product> _products = ObservableList<Product>();

  ObservableList<Product> get productsList => [..._products].asObservable();

  @action
  filterAll() {
    list();
  }

  @action
  filterPreco() {
    _products.sort((a, b) => a.price.compareTo(b.price));
  }

  @action
  filterPOPULARIDADE() {
    _products.sort((a, b) => b.score.compareTo(a.score));
  }

  @action
  filterORDEM_ALFABETICA() {
    _products.sort((a, b) => a.name.compareTo(b.name));
  }

  int get listSize {
    return _products.length;
  }

  _HomeController() {
    list();
  }

  @action
  list() {
    _products =
        INFORMATION.map((e) => Product.fromJson(e)).toList().asObservable();
  }
}
