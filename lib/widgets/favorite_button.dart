import 'package:RealSnkrShop/providers/sneaker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteButton extends StatelessWidget {
  final double radius;

  FavoriteButton(
    this.radius,
  );
  @override
  Widget build(BuildContext context) {
    final sneaker = Provider.of<Sneaker>(context);
    return Container(
      width: radius,
      height: radius,
      child: Icon(Icons.favorite, color: Colors.white),
      decoration: new BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: sneaker.isFavorite
              ? [
                  Color.fromRGBO(225, 78, 162, 1),
                  Color.fromRGBO(255, 180, 118, 1),
                ]
              : [
                  Color.fromRGBO(211, 211, 211, 1),
                  Color.fromRGBO(105, 105, 105, 1),
                ],
        ),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 4,
            blurRadius: 7,
            offset: Offset(0.5, 0.5),
          ),
        ],
      ),
    );
  }
}
