import 'package:flutter/material.dart';


class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Bem vindo!"),
            centerTitle: true,
          ),
          body: Column(
            children: [
              //
              //
              ListTile(
                leading: Icon(
                  Icons.wb_sunny,
                  size: 26,
                ),
                title: Text("Tema Esta Escuro"),
                onTap: () {
                 
                },
              ),
              //
              //
            ],
          ),
        ),
      ),
    );
  }
}
