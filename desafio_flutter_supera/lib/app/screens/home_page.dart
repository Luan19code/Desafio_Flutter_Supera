import 'package:flutter/material.dart';

import 'info_page.dart';
import 'product/product_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  int _selectedScreenIndex = 0;

  List<Widget> _screens = [ProductPage(), InfoPage()];

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedScreenIndex],
      bottomNavigationBar: SizedBox(
        child: BottomNavigationBar(
          onTap: _selectScreen,
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedScreenIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.store_mall_directory_outlined),
              label: "Produtos",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info_outline),
              label: "Informações",
            )
          ],
        ),
      ),
    );
  }
}
