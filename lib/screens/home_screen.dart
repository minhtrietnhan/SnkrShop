import 'dart:io';

import 'package:RealSnkrShop/screens/cart_screen.dart';
import 'package:RealSnkrShop/widgets/app_drawer.dart';
import 'package:flutter/material.dart';

import '../widgets/popular_carousel.dart';
import '../widgets/collection_carousel.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = 'home-screen';
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final _appBar = AppBar(
      title: Text('Sneaker Shop'),
      elevation: 0,
      actions: [
        IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {
            Navigator.of(context).pushNamed(CartScreen.routeName);
          },
        )
      ],
    );
    return Scaffold(
      appBar: _appBar,
      drawer: AppDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Color.fromRGBO(228, 229, 232, 1),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/airjordan_logo.jpg',
                  color: Color.fromRGBO(228, 229, 232, 1),
                  colorBlendMode: BlendMode.darken,
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Popular',
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Raleway'),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                PopularCarousel(),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Collection',
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Raleway'),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  height: (mediaQuery.size.height -
                          _appBar.preferredSize.height -
                          mediaQuery.padding.top) *
                      0.7,
                  child: CollectionCarousel(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
