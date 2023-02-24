import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica_veflat/services/servicio_api.dart';
import 'package:prueba_tecnica_veflat/widgets/card_product.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final servicio = Provider.of<ProductService>(context);
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(
        top: 60,
        left: 10,
        right: 10,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Hello,',
                    style: TextStyle(fontSize: 30),
                  ),
                  Text('Amanda',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow[700])),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.redAccent,
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.redAccent,
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, 'shop');
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 4),
          Expanded(
            child: servicio.personajes.isEmpty
                ? const Center(child: CircularProgressIndicator.adaptive())
                : ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: servicio.personajes.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CardProduct(
                        personaje: servicio.personajes[index],
                      );
                    },
                  ),
          )
        ],
      ),
    ));
  }
}
