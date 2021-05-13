import 'package:desafio_flutter_supera/controller/cart_controller.dart';
import 'package:desafio_flutter_supera/model/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'widget/cart_item_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartController cart = Provider.of(context);
    final cartItems = cart.cartList.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("Carrinho"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              cart.removeAll();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(12),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Chip(
                    label: Observer(
                      builder: (context) => Text(
                        "R\$ ${cart.totalAmount.toStringAsFixed(2)} + ${cart.totalShipping}",
                        style: TextStyle(
                          color:
                              Theme.of(context).primaryTextTheme.button.color,
                        ),
                      ),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: Observer(
            builder: (context) => ListView.builder(
              itemCount: cart.listSize,
              itemBuilder: (context, index) => CartItemWidget(
                cartItem: cartItems[index],
              ),
            ),
          )),
          Container(
            width: double.infinity,
            height: 50,
            color: Colors.black38,
            child: TextButton(
              onPressed: () {},
              child: Text(
                "Comprar",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// class OrderButton extends StatefulWidget {
//   const OrderButton({
//     Key key,
//     @required this.cart,

//   }) : super(key: key);

//   final Cart cart;

//   @override
//   _OrderButtonState createState() => _OrderButtonState();
// }

// class _OrderButtonState extends State<OrderButton> {
//   bool _isLoading = false;

//   @override
//   Widget build(BuildContext context) {
//     return _isLoading
//         ? Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 50),
//           child: CircularProgressIndicator(),
//         )
//         : TextButton (
//             child: Text("COMPRAR"),

//             onPressed: widget.cart.totalAmount <= 0
//                 ? null
//                 : () async {
//                     setState(() {
//                       _isLoading = true;
//                     });

//                     await widget.orders.addOrder(widget.cart);

//                     setState(() {
//                       _isLoading = false;
//                     });
//                     // cart.clear();
//                   },
//           );
//   }
// }
