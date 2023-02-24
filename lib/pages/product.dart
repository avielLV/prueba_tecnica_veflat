import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica_veflat/model/rick_morty_api.dart';
import 'package:prueba_tecnica_veflat/services/servicio_api.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final service = Provider.of<ProductService>(context);
    final size = MediaQuery.of(context).size;
    final Result personaje =
        ModalRoute.of(context)!.settings.arguments as Result;
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: size.height,
          width: double.infinity,
          child: FadeInImage(
              fit: BoxFit.cover,
              placeholder: const AssetImage('assert/giphy.gif'),
              image: NetworkImage(personaje.image)),
        ),
        Container(
          width: size.width,
          height: 40,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white,
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white,
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.heart_broken_outlined,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white,
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            padding: const EdgeInsets.only(top: 30, left: 30),
            width: size.width * 0.8,
            height: 260,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                  bottomLeft: Radius.circular(30)),
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Crop Top
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Crop Top',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Row(
                        children: [
                          dopSelec(color: Colors.red),
                          const SizedBox(width: 6),
                          dopSelec(color: Colors.yellow),
                          const SizedBox(width: 6),
                          dopSelec(color: Colors.blue),
                        ],
                      ),
                    )
                  ],
                ),
                //Size
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Size',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _tallaSelec(
                            talla: 'Xs',
                            color: Colors.white,
                          ),
                          _tallaSelec(
                            talla: 'S',
                            color: Colors.white,
                          ),
                          _tallaSelec(
                            talla: 'M',
                            color: Colors.black,
                          ),
                          _tallaSelec(
                            talla: 'L',
                            color: Colors.white,
                          ),
                          _tallaSelec(
                            talla: 'XL',
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '30% off',
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.blue[900],
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: const [
                              Text(
                                '\$58',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: 4),
                              Text(
                                '\$55',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        await service.agregarAShopping(personaje);
                        Navigator.pushNamed(context, 'shop');
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40))),
                        width: 120,
                        height: 50,
                        child: const Center(
                          child: Text(
                            'Add to Bag',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}

class _tallaSelec extends StatelessWidget {
  String talla;
  Color color;
  _tallaSelec({required this.color, required this.talla});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Center(
        child: Text(
          talla,
          style: const TextStyle(fontSize: 20, color: Colors.grey),
        ),
      ),
    );
  }
}

class dopSelec extends StatelessWidget {
  Color color;
  dopSelec({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(100))),
    );
  }
}
