import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  int page = 0;
  final List _shopItems = [
    [
      'U.S Prime',
      '8.55',
      'lib/images/meat.png',
      Colors.red,
      'Prime beef is produced from young, well-fed beef cattle. It has abundant marbling (the amount of fat interspersed with lean meat), and is generally sold in restaurants and hotels. Prime roasts and steaks are excellent for dry-heat cooking such as broiling, roasting or grilling.'
    ],
    [
      'U.S Choice',
      '6.20',
      'lib/images/meat1.png',
      Colors.yellow,
      'Choice beef is high quality, but has less marbling than Prime. Choice roasts and steaks from the loin and rib will be very tender, juicy, and flavorful and are suited for dry-heat cooking. Many of the less tender cuts can also be cooked with dry heat if not overcooked. Such cuts will be most tender if braised, roasted or simmered with a small amount of liquid in a tightly covered pan.'
    ],
    [
      'U.S Select',
      '4.20',
      'lib/images/meat2.png',
      Colors.green,
      'Select beef is very uniform in quality and normally leaner than the higher grades. It is fairly tender, but, because it has less marbling, it may lack some of the juiciness and flavor of the higher grades. Only the tender cuts should be cooked with dry heat. Other cuts should be marinated before cooking or braised to obtain maximum tenderness and flavor.'
    ],
    [
      'U.S Utility',
      '2.05',
      'lib/images/meat3.png',
      Colors.amber,
      'Standard and Commercial grades of beef are frequently sold as ungraded or as store brand meat. Utility, Cutter, and Canner grades of beef are seldom, if ever, sold at retail but are used instead to make ground beef and processed products.'
    ]
  ];
  List _cartItems = [];
  get shopItems => _shopItems;
  get cartItems => _cartItems;

  void addItemToCart(int index) {
    page++;
    _cartItems.add(_shopItems[index]);

    notifyListeners();
  }

  void removeItemFromCart(int index) {
    page--;
    _cartItems.removeAt(index);
    print(cartItems.length);
    notifyListeners();
  }

  void removeAllItems() {
    _cartItems.clear();
    page = 0;
    notifyListeners();
  }

  String calculateTotalPrice() {
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }

  void removeItemFromCartInDesc(name) {
    for (int i = 0; i < _cartItems.length; i++) {
      if (_cartItems[i][0] == name) {
        _cartItems.remove(_cartItems[i]);
        page--;
        notifyListeners();
      }
      ;
    }
  }
}
