// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CartController on _CartController, Store {
  final _$_cartAtom = Atom(name: '_CartController._cart');

  @override
  ObservableMap<String, Cart> get _cart {
    _$_cartAtom.reportRead();
    return super._cart;
  }

  @override
  set _cart(ObservableMap<String, Cart> value) {
    _$_cartAtom.reportWrite(value, super._cart, () {
      super._cart = value;
    });
  }

  final _$_CartControllerActionController =
      ActionController(name: '_CartController');

  @override
  void clear() {
    final _$actionInfo = _$_CartControllerActionController.startAction(
        name: '_CartController.clear');
    try {
      return super.clear();
    } finally {
      _$_CartControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addBuy(Product product) {
    final _$actionInfo = _$_CartControllerActionController.startAction(
        name: '_CartController.addBuy');
    try {
      return super.addBuy(product);
    } finally {
      _$_CartControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeBuy(Product product) {
    final _$actionInfo = _$_CartControllerActionController.startAction(
        name: '_CartController.removeBuy');
    try {
      return super.removeBuy(product);
    } finally {
      _$_CartControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
