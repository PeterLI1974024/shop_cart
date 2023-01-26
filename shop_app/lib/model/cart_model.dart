import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  final List _shopItems = [
    [
      'U.S Prime',
      '8.55',
      'lib/images/meat.png',
      Colors.red,
    ],
    [
      'U.S Choice',
      '6.20',
      'lib/images/meat1.png',
      Color.fromARGB(255, 210, 198, 94),
    ],
    [
      'U.S Select',
      '4.20',
      'lib/images/meat2.png',
      Colors.green,
    ],
    ['U.S Utility', '2.05', 'lib/images/meat3.png', Colors.amber]
  ];

  get shopItems => _shopItems;
}
