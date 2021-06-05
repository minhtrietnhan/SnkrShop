import 'package:flutter/material.dart';

class Sneaker with ChangeNotifier {
  final String id;
  final String name;
  final DateTime releaseDate;
  final String colorWay;
  final double originalPrice;
  final double marketPrice;
  final String imageUrl;
  bool isFavorite;
  bool isPopular;

  Sneaker({
    this.id,
    this.name,
    this.releaseDate,
    this.colorWay,
    this.originalPrice,
    this.marketPrice,
    this.imageUrl,
    this.isFavorite = false,
    this.isPopular = false,
  });

  void toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
