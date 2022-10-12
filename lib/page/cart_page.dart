import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/cart_model.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Panier flutter sales", style: TextStyle(color: Colors.black)))),
      body: Stack(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Votre panier total est de"),
            Text("0.00€", style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text("Votre panier contient ${context.watch<CartModel>().lsProducts.length} éléments"),
            Consumer<CartModel>(
              builder: (_,cart,__){
              return Expanded(
                child: ListView.builder(
                  itemCount: cart.lsProducts.length,
                  itemBuilder: (_,index)=>ListTile(leading: Image.network(cart.lsProducts[index].image, width: 50, height: 50), title: Text(cart.lsProducts[index].title), trailing:
                  IconButton(icon: Icon(Icons.delete_forever), onPressed: ()=>context.read<CartModel>().removeByProduct(cart.lsProducts[index])),)
                ),
              );},
            )
          ]),
        ),
        Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(13.0),
              child: TextButton(
                  onPressed: ()=>context.read<CartModel>().removeAllProducts(),
                  child: Text("Remove All")),
            )),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Text("Prix total du panier: ${context.read<CartModel>().getTotalPriceCart()} €", style: TextStyle(fontWeight: FontWeight.bold),),
          ),
        )
      ]),
    );
  }
}
