// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeController, Store {
  final _$_productsAtom = Atom(name: '_HomeController._products');

  @override
  ObservableList<Product> get _products {
    _$_productsAtom.reportRead();
    return super._products;
  }

  @override
  set _products(ObservableList<Product> value) {
    _$_productsAtom.reportWrite(value, super._products, () {
      super._products = value;
    });
  }

  final _$_HomeControllerActionController =
      ActionController(name: '_HomeController');

  @override
  dynamic filterAll() {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.filterAll');
    try {
      return super.filterAll();
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic filterPreco() {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.filterPreco');
    try {
      return super.filterPreco();
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic filterPOPULARIDADE() {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.filterPOPULARIDADE');
    try {
      return super.filterPOPULARIDADE();
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic filterORDEM_ALFABETICA() {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.filterORDEM_ALFABETICA');
    try {
      return super.filterORDEM_ALFABETICA();
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic list() {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.list');
    try {
      return super.list();
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
