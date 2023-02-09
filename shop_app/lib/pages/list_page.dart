import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/model/cart_model.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 200, 33, 33),
          child: Icon(Icons.delete),
          onPressed: () {
            Provider.of<Cart>(context, listen: false).removeAllItems();
          },
        ),
        backgroundColor: Color.fromARGB(255, 242, 224, 226),
        body: Consumer<Cart>(
          builder: (context, cart, child) {
            return SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Container(
                      height: 30,
                      width: 300,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.shopping_cart,
                            size: 30,
                            color: Color.fromARGB(255, 212, 23, 52),
                          ),
                          Text(
                            'shopping cart',
                            style: GoogleFonts.sail(fontSize: 30),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: cart.cartItems.length,
                        itemBuilder: ((context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(14),
                            child: Opacity(
                              opacity: 0.9,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 203, 191, 191),
                                    borderRadius: BorderRadius.circular(12)),
                                child: ListTile(
                                  leading:
                                      Image.asset(cart.cartItems[index][2]),
                                  subtitle: Text(cart.cartItems[index][1]),
                                  title: Text(cart.cartItems[index][0]),
                                  trailing: IconButton(
                                      onPressed: () {
                                        cart.removeItemFromCart(index);
                                      },
                                      icon: Icon(Icons.cancel)),
                                ),
                              ),
                            ),
                          );
                        })),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 200, 170, 185),
                          borderRadius: BorderRadius.circular(20)),
                      padding: EdgeInsets.all(24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Total price: \$',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            cart.calculateTotalPrice(),
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ));
  }
}
