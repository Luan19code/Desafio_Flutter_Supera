import 'package:desafio_flutter_supera/model/products.dart';
import 'package:desafio_flutter_supera/widgets/badge.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final Product product;

  const CardWidget({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                trailing: Badge(
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
                backgroundColor: Colors.black45,
              ),
            ),
          ),
        );
      },
    );
  }
}
