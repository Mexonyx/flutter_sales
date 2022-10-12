import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../model/product_model.dart';

class DetailArticle extends StatelessWidget {
  final Product product;
  const DetailArticle(this.product,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("détail du produit")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(tag:product.id, child: Image.network(product.image, width: 150, height: 200)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(product.title),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Description", style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: Text(product.description),
            ),
            Padding(
              padding: const EdgeInsets.only(
              top: 50.0,
              left: 13.0,
              right: 13.0,
              bottom: 30.0,
              ),
              child: InkWell(
                  onTap: ()=>context.go('/list/detail/avis', extra: product),
                  child: Text("Avis", style: TextStyle(fontWeight: FontWeight.bold))
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: InkWell(
                  onTap: ()=>context.go('/list/detail/avis', extra: product),
                  child: Text(product.description)
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 50.0,
                left: 13.0,
                right: 13.0,
                bottom: 30.0,
              ),
              child: Text("Caractéristiques", style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: Text(product.description),
            ),
          ],
        ),
      ),
    );
  }
}
