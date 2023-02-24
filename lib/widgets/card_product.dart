import 'package:flutter/material.dart';
import 'package:prueba_tecnica_veflat/model/rick_morty_api.dart';

class CardProduct extends StatelessWidget {
  Result personaje;
  CardProduct({super.key, required this.personaje});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, 'product', arguments: personaje);
        },
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color.fromRGBO(253, 223, 235, 1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 200,
                    padding: const EdgeInsets.only(bottom: 22, left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          personaje.name,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          personaje.species,
                          style: TextStyle(fontSize: 24),
                        ),
                      ],
                    ),
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    child: SizedBox(
                      height: 160,
                      width: 100,
                      child: FadeInImage(
                          fit: BoxFit.cover,
                          placeholder: const AssetImage('assert/giphy.gif'),
                          image: NetworkImage(personaje.image)),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
