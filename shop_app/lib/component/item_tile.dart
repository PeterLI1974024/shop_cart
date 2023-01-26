import 'package:flutter/material.dart';

class ItemTile extends StatelessWidget {
  final String name;
  final String price;
  final String image;
  final colour;

  const ItemTile(
      {super.key,
      required this.name,
      required this.price,
      required this.image,
      required this.colour});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
            color: colour[100], borderRadius: BorderRadius.circular(36)),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Image.asset(
            image,
            height: 120,
          ),
          Text(
            name,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          MaterialButton(
            onPressed: () {},
            color: colour,
            child: Text(
              price,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          )
        ]),
      ),
    );
  }
}
