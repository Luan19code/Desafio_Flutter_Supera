import 'package:desafio_flutter_supera/app/screens/product/widgets/card.dart';
import 'package:desafio_flutter_supera/controller/cart_controller.dart';
import 'package:desafio_flutter_supera/controller/home_controller.dart';
import 'package:desafio_flutter_supera/utils/routes.dart';
import 'package:desafio_flutter_supera/widgets/badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

enum FilterOptions {
  PRICE,
  POPULARITY,
  ALPHABETICAL_ORDER,
  All,
}

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Provider.of(context);
    final CartController cartController = Provider.of(context);

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
                  Observer(builder: (context) {
                    return Badge(
                      positionedRight: 5,
                      positionedTop: 5,
                      value: cartController.listSize.toString() ?? "0",
                      color: Colors.white,
                      child: InkWell(
                        onLongPress: () {},
                        child: IconButton(
                          iconSize: 30,
                          icon: Icon(Icons.shopping_cart),
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                              Routes.CART,
                            );
                          },
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                    );
                  }),

                  PopupMenuButton(
                    onSelected: (value) {
                      if (value == FilterOptions.All) {
                        homeController.filterAll();
                      } else if (value == FilterOptions.PRICE) {
                        homeController.filterPrice();
                      } else if (value == FilterOptions.POPULARITY) {
                        homeController.filterPopularity();
                      } else if (value == FilterOptions.ALPHABETICAL_ORDER) {
                        homeController.filterAlphabetical_Order();
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
                        value: FilterOptions.PRICE,
                      ),
                      PopupMenuItem(
                        child: Center(child: Text("Popularidade")),
                        value: FilterOptions.POPULARITY,
                      ),
                      PopupMenuItem(
                        child: Center(child: Text("Ordem alfabética")),
                        value: FilterOptions.ALPHABETICAL_ORDER,
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
                  if (homeController.listSize > 0) {
                    return GridView.builder(
                      itemCount: homeController.listSize,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 550,
                          childAspectRatio: 3 / 2,
                          mainAxisExtent: 250,
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 10),

                      // ),
                      itemBuilder: (context, index) {
                        return CardWidget(
                          product: homeController.productsList[index],
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
            ),
          ),
        );
      },
    );
  }
}
