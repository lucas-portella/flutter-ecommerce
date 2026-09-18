import 'package:ecommerce/features/home/models/products_model.dart';
import 'package:flutter/material.dart';

class CartItem {
  Product product;
  int quantity;

  CartItem({required this.product, required this.quantity});

  void increaseQuatity() {
    quantity++;
  }

  void decrementQuantity() {
    if (quantity == 1) {
      throw StateError('Last item in CartItem');
    }
    quantity--;
  }

  double getSubtotal() {
    return product.price * quantity;
  }
}

class CartController extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get cartItems => _items;

  void addProduct(Product product) {
    if (isProductInCart(product)) return;

    _items.add(CartItem(product: product, quantity: 1));
    // notifyListeners();
  }

  void removeProduct(Product product) {
    _items.removeWhere((item) => item.product == product);
    notifyListeners();
  }

  double getTotalPrice() {
    double totalPrice = 0;

    for (var item in _items) {
      totalPrice += item.product.price * item.quantity;
    }

    return totalPrice;
  }

  bool isProductInCart(Product product) {
    for (CartItem item in _items) {
      if (product == item.product) {
        return true;
      }
    }

    return false;
  }

  void increaseQuantityOf(CartItem item) {
    item.increaseQuatity();
    notifyListeners();
  }

  void decreaseQuantityOf(CartItem item) {
    item.decrementQuantity();
    notifyListeners();
  }
}
