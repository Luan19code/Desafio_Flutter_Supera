import 'package:desafio_flutter_supera/controller/cart_controller.dart';
import 'package:desafio_flutter_supera/model/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class CartItemWidget extends StatelessWidget {
  //Gerar desliza em um container, usado para aqui para apagar algo
  final Cart cartItem;

  const CartItemWidget({Key key, this.cartItem}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final CartController cart = Provider.of(context);

    return Container(
      child: Dismissible(
        key: ValueKey(cart.idProduct(cartItem)),
        background: Container(
          color: Theme.of(context).errorColor,
          child: Icon(
            Icons.delete_forever,
            color: Colors.white,
            size: 40,
          ),
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: 20),
          margin: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 4,
          ),
        ),
        direction: DismissDirection.endToStart,
        confirmDismiss: (_) {
          return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Tem certeza?"),
                content: Text("Quer remover o item do carrinho?"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: Text("Não"),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: Text("Sim"),
                  ),
                ],
              );
            },
          );
        },
        onDismissed: (_) => cart.removeList(cartItem.product),
        child: Card(
          margin: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 4,
          ),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: ListTile(
              leading: CircleAvatar(
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: FittedBox(
                    child: Text("${cartItem.price.toStringAsFixed(2)} "),
                  ),
                ),
              ),
              title: Text(
                cartItem.title,
              ),
              subtitle: Observer(
                builder: (context) => Text(
                  "Total: R\$${cart.totalOfProduct(cartItem)}",
                ),
              ),
              trailing: Container(
                width: 115,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () => cart.removeBuy(cartItem.product),
                      child: Text(
                        "-",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Observer(
                      builder: (context) => CircleAvatar(
                          child: Text("${cart.amountOfProduct(cartItem)}")),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () => cart.addBuy(cartItem.product),
                      child: Container(
                        width: 20,
                        child: Text(
                          "+",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
