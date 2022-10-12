import 'package:flutter/foundation.dart';

import 'product_model.dart';


class CartModel extends ChangeNotifier{
  final List<Product> lsProducts;

  CartModel(this.lsProducts);

  addProduct(Product product){
    lsProducts.add(product);
    notifyListeners();
  }

  removeAllProducts(){
    lsProducts.clear();
    notifyListeners();
  }

  getTotalPriceCart(){
    num price = 0;
    for(Product product in lsProducts){
      price += product.price;
    }
    return price;
  }

  removeByProduct(Product product){
    lsProducts.remove(product);
    notifyListeners();
  }
}