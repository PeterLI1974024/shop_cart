import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pages/page.dart';
import 'package:provider/provider.dart';
import 'model/cart_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(),
      child: MaterialApp(
        theme: ThemeData(
            appBarTheme: AppBarTheme(
          // brightness: Brightness.dark,
          color: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
          ),
        )),
        debugShowCheckedModeBanner: false,
        home: IntroPage(),
      ),
    );
  }
}
