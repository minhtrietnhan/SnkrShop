import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/favorite_button.dart';
import '../screens/sneaker_detail_screen.dart';
import '../providers/sneaker.dart';

class SneakerItem extends StatelessWidget {
  // final String name;
  // final String imageUrl;
  // final double price;

  // SneakerItem(this.name, this.price, this.imageUrl);
  @override
  Widget build(BuildContext context) {
    final sneaker = Provider.of<Sneaker>(
      context,
      listen: false,
    );
    return Card(
      elevation: 7,
      margin: const EdgeInsets.symmetric(
        vertical: 18,
        horizontal: 15,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            SneakerDetailScreen.routeName,
            arguments: sneaker.id,
          );
        },
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  Image.asset(
                    sneaker.imageUrl,
                    fit: BoxFit.fitWidth,
                  ),
                  Positioned(
                    top: 15,
                    right: 15,
                    child: GestureDetector(
                      onTap: sneaker.toggleFavorite,
                      child: ChangeNotifierProvider.value(
                        value: sneaker,
                        child: FavoriteButton(
                          40.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  // container for name
                  width: 230,
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: Text(
                    sneaker.name,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'RobotoCondensed',
                    ),
                  ),
                ),
                Container(
                  // container for price
                  padding: const EdgeInsets.only(
                    right: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Market Price',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'RobotoCondensed',
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        '\$${sneaker.marketPrice.toStringAsFixed(0)}',
                        style: TextStyle(
                          fontFamily: 'RobotoCondensed',
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
