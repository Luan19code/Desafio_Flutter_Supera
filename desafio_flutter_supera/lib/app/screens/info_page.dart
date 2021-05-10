import 'package:desafio_flutter_supera/controller/home_controller.dart';
import 'package:desafio_flutter_supera/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController home_controller = Provider.of(context);

    return LayoutBuilder(
      builder: (context, constraints_um) {
        //
        //
        return Container(
          color: Theme.of(context).primaryColor,
          child: SafeArea(
            //
            //
            child: Scaffold(
              //
              //
              appBar: AppBar(
                title: Text("Informações"),
                centerTitle: true,
              ),
              //
              //
              body: LayoutBuilder(
                builder: (context, constraints_dois) {
                  //
                  //
                  return Center(
                    child: Container(
                      height: 60,
                      // color: Colors.red,
                      child: ListTile(
                        subtitle: Text(
                          "Total de Produtos",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Theme.of(context).accentColor,
                          ),
                          // overflow: TextOverflow.ellipsis,
                        ),
                        title: Text(
                          home_controller.listSize.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Theme.of(context).accentColor,
                          ),
                          // overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  );
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
