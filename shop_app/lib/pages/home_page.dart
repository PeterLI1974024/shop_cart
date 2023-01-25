import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/component/item_tile.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/model/cart_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'fresh item',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Expanded(child: Consumer<Cart>(builder: (((context, value, child) {
              return GridView.builder(
                itemCount: value.shopItems.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: ((context, index) {
                  return ItemTile(
                    name: value.shopItems[index][0],
                    price: value.shopItems[index][1],
                    image: value.shopItems[index][2],
                    colour: value.shopItems[index][3],
                  );
                }),
              );
            })))),
          ]),
        ));
  }
}
