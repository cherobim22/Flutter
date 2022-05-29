import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shoppingapp/components/product_item.dart';
import 'package:shoppingapp/data/dummy_data.dart';
import 'package:shoppingapp/redux/app_store.dart';
import 'package:http/http.dart' as http;

import '../models/product.dart';

class ProductsOverviewPage extends StatelessWidget {
  ProductsOverviewPage({Key? key}) : super(key: key);
  final List<Product> loadedProducts = dummy_products;

  // http://localhost:8080/plant?itemsPerPage=100
  Future<Map> _getPlants() async {
    final ContaUnicaUrl =
        Uri.parse('http://localhost:8080/plant?itemsPerPage=100');
    final response = await http.get(
      ContaUnicaUrl,
      headers: {"Content-Type": "application/json"},
      // encoding: Encoding.getByName('utf-8'),
    );
    print('_getPlants');
    print(response.statusCode);

    if (response.statusCode == 200) {
      var parsed = json.decode(response.body);
      final data = parsed;
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          appStore.dispatcher(AppAction.increment, 4);
        },
      ),
      appBar: AppBar(
        title: Text('Products'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/products/detail');
              },
              child: Text('change'))
        ],
      ),
      body: AnimatedBuilder(
          animation: appStore,
          builder: (context, snapshot) {
            return GridView.builder(
                itemCount: loadedProducts.length,
                itemBuilder: (context, index) => Column(
                      children: [
                        Text('${appStore.state.value}'),
                        IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/counter');
                            },
                            icon: Icon(Icons.add)),
                        IconButton(
                            onPressed: () async {
                              print('clicck');
                              final json = await _getPlants();
                              print(json['totalRows']);

                              appStore.dispatcher(AppAction.addByPost,
                                  int.parse('${json['totalRows']}'));
                            },
                            iconSize: 30,
                            icon: Icon(Icons.pending_actions))
                      ],
                    ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 3 / 2));
          }),
    );
  }
}
