import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/product.dart';

class ProductDetail extends StatelessWidget {
  // final Product product;
  const ProductDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ! garante que aquele elemento vai existir
    // ? diz que talvez aquele elemento possa existir

    final Product product =
        ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
    );
  }
}
