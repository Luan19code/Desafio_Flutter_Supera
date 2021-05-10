import 'package:desafio_flutter_supera/app/screens/product/widgets/card.dart';
import 'package:desafio_flutter_supera/controller/home_controller.dart';
import 'package:desafio_flutter_supera/widgets/badge.dart';
import 'package:desafio_flutter_supera/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

enum FilterOptions {
  PRECO,
  POPULARIDADE,
  ORDEM_ALFABETICA,
  All,
}

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeController home_controller = Provider.of(context);

    return LayoutBuilder(
      builder: (context, constraints_one) {
        return Container(
          color: Theme.of(context).primaryColor,
          child: SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: Text("Produtos"),
                centerTitle: true,
                actions: [
                  Badge(
                    positionedRight: 5,
                    positionedTop: 5,
                    value: "0",
                    color: Colors.white,
                    child: InkWell(
                      onLongPress: () {},
                      child: IconButton(
                        iconSize: 30,
                        icon: Icon(Icons.shopping_cart),
                        onPressed: () {
                          //
                        },
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  ),
                  PopupMenuButton(
                    onSelected: (value) {
                      if (value == FilterOptions.All) {
                        home_controller.filterAll();
                      } else if (value == FilterOptions.PRECO) {
                        home_controller.filterPreco();
                      } else if (value == FilterOptions.POPULARIDADE) {
                        home_controller.filterPOPULARIDADE();
                      } else if (value == FilterOptions.ORDEM_ALFABETICA) {
                        home_controller.filterORDEM_ALFABETICA();
                      }
                    },
                    itemBuilder: (_) => [
                      PopupMenuItem(
                        child: Center(
                            child: Text(
                          "::Ordenar::",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                        value: FilterOptions.All,
                      ),
                      PopupMenuItem(
                        child: Center(child: Text("Preço")),
                        value: FilterOptions.PRECO,
                      ),
                      PopupMenuItem(
                        child: Center(child: Text("Popularidade")),
                        value: FilterOptions.POPULARIDADE,
                      ),
                      PopupMenuItem(
                        child: Center(child: Text("Ordem alfabética")),
                        value: FilterOptions.ORDEM_ALFABETICA,
                      ),
                    ],
                  ),
                  //
                ],
              ),
              //
              //
              body: Observer(
                builder: (context) {
                  if (home_controller.listSize > 0) {
                    return GridView.builder(
                      itemCount: home_controller.listSize,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 550,
                          childAspectRatio: 3 / 2,
                          mainAxisExtent: 250,
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 10),

                      // ),
                      itemBuilder: (context, index) {
                        return CardWidget(
                          product: home_controller.productsList[index],
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: ListTile(
                        title: Text(
                          "Sem Produtos Cadastrados",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Theme.of(context).accentColor,
                          ),
                          // overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    );
                  }
                },
              ),

              drawer: MainDrawer(),
            ),
          ),
        );
      },
    );
  }
}