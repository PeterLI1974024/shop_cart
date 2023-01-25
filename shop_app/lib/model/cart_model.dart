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
      'lib/images/meat.png',
      Colors.yellow,
    ],
    [
      'U.S Select',
      '4.20',
      'lib/images/meat.png',
      Colors.green,
    ],
    ['U.S Utility', '2.05', 'lib/images/meat.png', Colors.amber]
  ];

  get shopItems => _shopItems;
}
