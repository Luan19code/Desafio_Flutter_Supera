import 'package:desafio_flutter_supera/app/screens/home_page.dart';
import 'package:desafio_flutter_supera/controller/home_controller.dart';
import 'package:desafio_flutter_supera/utils/global_variables.dart';
import 'package:desafio_flutter_supera/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'app/screens/view_cart/cart_screen.dart';
import 'controller/cart_controller.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (_) => new HomeController()),
        Provider(create: (_) => new CartController()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [const Locale('pt', 'BR')],
      debugShowCheckedModeBanner: false,
      theme: GlobalVariables.tema(context),
      routes: {
        Routes.HOME: (_) => HomePage(),
        Routes.CART: (context) => CartScreen(),
      },
    );
  }
}
