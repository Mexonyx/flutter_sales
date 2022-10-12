import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../model/cart_model.dart';
import '../model/product_model.dart';
import 'package:http/http.dart' as http;

class ListProductPage extends StatelessWidget {
  const ListProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Liste produit"), actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: InkWell(
                  onTap: () => context.go('/list/cart'),
                  child: Icon(Icons.shopping_cart)),
            )

      ]),
      body: FutureBuilder<http.Response>(
          future : http.get(Uri.parse("https://fakestoreapi.com/products/")),
          builder:(_,snapshot){
            if(snapshot.hasData && snapshot.data !=null){
              String body = snapshot.data!.body;
              final List<dynamic> lsProductsJSON= jsonDecode(body);
              List<Product> lsProducts = List.empty(growable: true);
              lsProductsJSON.forEach((mapProduct) =>
                 lsProducts.add(Product.fromJson(mapProduct)));
              return ListViewProducts(lsProducts: lsProducts);
            }
            return Center(child: const CircularProgressIndicator());
          }
       ),

    );
  }
}

class ListViewProducts extends StatelessWidget {
  const ListViewProducts({
    Key? key,
    required this.lsProducts,
  }) : super(key: key);

  final List<Product> lsProducts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: lsProducts.length,
        itemBuilder: (context, int index){
          return InkWell(
            onTap: () => context.go('/list/detail', extra: lsProducts[index]),
            child: ListTile(
              title: Text(lsProducts[index].title),
              subtitle: Text("${lsProducts[index].price} €",
                  style: Theme.of(context).textTheme.titleLarge),
              leading: Hero(tag: lsProducts[index].id, child: Image.network(lsProducts[index].image, width: 80, height: 80)),
              trailing: TextButton(
                onPressed: ()=>context.read<CartModel>().addProduct(lsProducts[index]),
                child: Text("Add"),
              ),
            ),
          );
        });
  }
}
