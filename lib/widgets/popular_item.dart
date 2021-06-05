import 'package:RealSnkrShop/providers/sneaker.dart';
import 'package:RealSnkrShop/screens/sneaker_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PopularItem extends StatelessWidget {
  // final String name;
  // final String imageUrl;

  // PopularItem(this.name, this.imageUrl);
  @override
  Widget build(BuildContext context) {
    final sneaker = Provider.of<Sneaker>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed(SneakerDetailScreen.routeName, arguments: sneaker.id);
        },
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Container(
            width: 200,
            height: 150,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  child: Image.asset(
                    sneaker.imageUrl,
                    fit: BoxFit.contain,
                    height: 120,
                    width: 200,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 0.0),
                  child: Text(
                    sneaker.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                        fontSize: 19),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
