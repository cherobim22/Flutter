import 'package:flutter/material.dart';
import 'package:shoppingapp/models/product.dart';
import 'package:shoppingapp/pages/counter_page.dart';
import 'package:shoppingapp/pages/products_detail_page.dart';

import 'pages/products_overview_pager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.blue,
          fontFamily: 'Montserrat'),
      home: ProductsOverviewPage(),
      routes: {
        '/products/detail': (context) => ProductDetail(),
        '/counter': (context) => CounterPage()
      },
    );
  }
}
