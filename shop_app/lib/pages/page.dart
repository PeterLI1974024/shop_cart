import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/pages/home_page.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
      ),
      backgroundColor: Color.fromARGB(255, 244, 222, 224),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(left: 80, right: 90, top: 150),
          child: Image.asset('lib/images/meat.png'),
        ),
        Padding(
          padding: EdgeInsets.all(24.0),
          child: Text(
            'All kinds of different meat from all around the world',
            textAlign: TextAlign.center,
            style: GoogleFonts.sail(fontSize: 30),
          ),
        ),
        const Text(
          'best meat quality in the world',
          style: TextStyle(color: Color.fromARGB(255, 119, 98, 98)),
        ),
        const SizedBox(
          height: 120,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const HomePage();
            }));
          },
          child: Hero(
            tag: 'picture',
            child: Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 100, 63, 115),
                  borderRadius: BorderRadius.circular(40)),
              padding: EdgeInsets.all(24),
              child: Text(
                'Get started',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
