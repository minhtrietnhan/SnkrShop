import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String name;
  final double price;
  final String imageUrl;
  final int quantity;

  CartItem({
    this.id,
    this.name,
    this.price,
    this.imageUrl,
    this.quantity,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double totalPrice() {
    var total = 0.0;
    _items.forEach((key, value) {
      total += value.price * value.quantity;
    });
    return total;
  }

  void addItem(String id, String name, double price, String imageUrl) {
    if (_items.containsKey(id)) {
      print(id);
      print('add1');
      _items.update(
        id,
        (existingSneaker) => CartItem(
          id: existingSneaker.id,
          name: existingSneaker.name,
          price: existingSneaker.price,
          imageUrl: existingSneaker.imageUrl,
          quantity: existingSneaker.quantity + 1,
        ),
      );
    } else {
      print(id);
      print('add2');
      _items.putIfAbsent(
        id,
        () => CartItem(
            id: DateTime.now().toString(),
            name: name,
            price: price,
            imageUrl: imageUrl,
            quantity: 1),
      );
    }
    notifyListeners();
  }

  void removeAllItem(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void removeItem(String id) {
    if (_items.containsKey(id)) {
      print(id);
      print('rm1');
      _items.update(
        id,
        (existingSneaker) => CartItem(
          id: existingSneaker.id,
          name: existingSneaker.name,
          price: existingSneaker.price,
          imageUrl: existingSneaker.imageUrl,
          quantity:
              existingSneaker.quantity == 0 ? 0 : existingSneaker.quantity - 1,
        ),
      );
    }
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
