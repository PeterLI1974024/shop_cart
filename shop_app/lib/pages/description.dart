import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/model/cart_model.dart';

class Description extends StatefulWidget {
  final String image;
  final String desc;
  final index;
  final String name;
  const Description({
    super.key,
    required this.image,
    required this.desc,
    required this.index,
    required this.name,
  });

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 242, 224, 226),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 300,
                width: 500,
                child: Image.asset(widget.image),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: (() {
                        Provider.of<Cart>(context, listen: false)
                            .addItemToCart(widget.index);
                        setState(() {});
                      }),
                      icon: Icon(Icons.add)),
                  Text(
                    Provider.of<Cart>(context, listen: false).page.toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                  IconButton(
                      onPressed: () {
                        Provider.of<Cart>(context, listen: false)
                            .removeItemFromCartInDesc(widget.name);
                        print(widget.name);

                        setState(() {});
                      },
                      icon: Icon(Icons.remove))
                ],
              ),
              SizedBox(
                height: 10,
                width: 350,
                child: Divider(
                  color: Color.fromARGB(255, 157, 54, 95),
                  thickness: 0.8,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Hero(
                  tag: 'desc',
                  child: Container(
                    height: 500,
                    width: 350,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.desc,
                        style: GoogleFonts.sail(
                            fontSize: 25,
                            color: Color.fromARGB(255, 90, 95, 94)),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
