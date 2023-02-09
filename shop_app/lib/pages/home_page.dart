import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/component/item_tile.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/model/cart_model.dart';
import 'package:shop_app/pages/description.dart';
import 'list_page.dart';
import 'description.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ListPage();
            }));
          },
          backgroundColor: Color.fromARGB(255, 203, 131, 216),
          child: Icon(Icons.shopping_bag),
        ),
        backgroundColor: Color.fromARGB(255, 242, 224, 226),
        body: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 48,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Let's pick the fresh meat for you ",
                style: GoogleFonts.notoSerif(
                    fontSize: 36, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Ｍeat Type',
                style: TextStyle(fontSize: 22),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(child: Consumer<Cart>(builder: (((context, cart, child) {
              return GridView.builder(
                itemCount: cart.shopItems.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1 / 1.1),
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) {
                        return Description(
                          image: cart.shopItems[index][2],
                          desc: cart.shopItems[index][4],
                          index: index,
                          name: cart.shopItems[index][0],
                        );
                      })));
                    },
                    child: ItemTile(
                      name: cart.shopItems[index][0],
                      price: cart.shopItems[index][1],
                      image: cart.shopItems[index][2],
                      colour: cart.shopItems[index][3],
                      onPressed: () {
                        cart.addItemToCart(index);
                      },
                    ),
                  );
                }),
              );
            })))),
          ]),
        ));
  }
}
