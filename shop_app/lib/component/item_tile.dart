import 'dart:ffi';

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
    return Container(
      child: Column(children: [
        Image.asset(
          image,
          height: 150,
        )
      ]),
    );
  }
}
