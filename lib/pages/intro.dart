import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica_veflat/services/servicio_api.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    final service = Provider.of<ProductService>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.6,
            width: double.infinity,
            child: const Image(
              image: AssetImage('assert/rick.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 200,
                  child: const Text(
                    'Let your Style Speak',
                    style: TextStyle(fontSize: 36),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: 260,
                  child: const Text(
                    'Discover the lotest trends in women fashion and explore your personality',
                    style: TextStyle(
                        color: Colors.grey, fontSize: 16, height: 1.5),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 12),
                width: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    dop(
                      selec: 12,
                      color: Colors.black,
                    ),
                    dop(selec: 8, color: Colors.black38),
                    dop(selec: 8, color: Colors.black38),
                    dop(selec: 8, color: Colors.black38),
                  ],
                ),
              ),
              Container(
                width: 160,
                height: 60,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(40)),
                  color: Colors.black,
                ),
                child: Center(
                  child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'home');
                      },
                      child: const Text(
                        'Get Started',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class dop extends StatelessWidget {
  int selec;
  Color color;
  dop({super.key, required this.selec, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12,
      height: 8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: color,
      ),
    );
  }
}
