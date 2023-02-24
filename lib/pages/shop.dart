import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica_veflat/services/servicio_api.dart';
import 'package:prueba_tecnica_veflat/widgets/card_product.dart';
import 'package:prueba_tecnica_veflat/widgets/card_product_shop.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final service = Provider.of<ProductService>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          leading: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, 'home');
              },
              icon: Icon(Icons.arrow_back)),
          title: const Text('Lista de compra de personajes'),
        ),
        body: service.shopping.isEmpty
            ? const Center(child: Text('No seleccionado ningun personaje'))
            : Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: ListView.builder(
                  itemCount: service.shopping.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CardShopProduct(personaje: service.shopping[index]);
                  },
                ),
              ));
  }
}
