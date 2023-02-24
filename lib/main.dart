import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica_veflat/pages/home.dart';
import 'package:prueba_tecnica_veflat/pages/intro.dart';
import 'package:prueba_tecnica_veflat/pages/product.dart';
import 'package:prueba_tecnica_veflat/pages/shop.dart';
import 'package:prueba_tecnica_veflat/services/servicio_api.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ProductService())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'intro',
        routes: {
          'intro': (context) => const IntroPage(),
          'home': (context) => const HomePage(),
          'product': (context) => const ProductPage(),
          'shop': (context) => ShopPage(),
        },
      ),
    );
  }
}
