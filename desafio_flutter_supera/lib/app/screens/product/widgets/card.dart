import 'package:desafio_flutter_supera/controller/cart_controller.dart';
import 'package:desafio_flutter_supera/model/products.dart';
import 'package:desafio_flutter_supera/widgets/badge.dart';
import 'package:desafio_flutter_supera/widgets/snack_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class CardWidget extends StatelessWidget {
  final Product product;

  const CardWidget({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    final CartController cartController = Provider.of(context);
    //
    return LayoutBuilder(
      builder: (context, constraints) {
        // print(constraints.maxWidth);
        return ClipRRect(
          borderRadius: BorderRadius.circular(
            20,
          ),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
              ),
            ),
            child: GridTile(
              child: InkWell(
                onTap: () {},
                child: Image.asset(
                  "assets/" + product.image,
                  fit: BoxFit.contain,
                  semanticLabel: product.name,
                ),
              ),
              //
              //
              footer: GridTileBar(
                title: Expanded(
                  child: Text(
                    product.name,
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
                subtitle: Expanded(
                  child: Text(
                    "R\$ ${product.price}",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
                trailing: Observer(builder: (context) {
                  return Badge(
                    positionedRight: 5,
                    positionedTop: 5,
                    value: cartController.quantityProducts(product) != null
                        ? cartController.quantityProducts(product).toString()
                        : "0",
                    color: Colors.white,
                    child: InkWell(
                      onLongPress: () {
                        cartController.removeBuy(product);
                        showToast(context,
                            function: cartController.addBuy,
                            product: product,
                            text: "Item Removido do carrinho");
                      },
                      child: IconButton(
                        iconSize: 30,
                        icon: Icon(Icons.shopping_cart),
                        onPressed: () {
                          cartController.addBuy(product);
                          showToast(context,
                              function: cartController.removeBuy,
                              product: product,
                              text: "Item adicionado do carrinho");
                        },
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  );
                }),
                backgroundColor: Colors.black45,
              ),
            ),
          ),
        );
      },
    );
  }
}
