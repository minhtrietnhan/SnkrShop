import 'package:RealSnkrShop/providers/cart.dart';
import 'package:RealSnkrShop/widgets/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lipsum/lipsum.dart' as lipsum;
import 'package:provider/provider.dart';

import '../providers/sneakers.dart';

class SneakerDetailScreen extends StatelessWidget {
  static const routeName = 'sneaker-detail';
  final List sizes = [6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final _appBar = AppBar(
      title: Text('Sneaker Shop'),
      elevation: 0,
      backgroundColor: Color.fromRGBO(228, 229, 232, 1),
    );
    final sneakerId = ModalRoute.of(context).settings.arguments as String;
    final sneaker = Provider.of<Sneakers>(context).findById(sneakerId);
    final cart = Provider.of<Cart>(context);
    print(sneaker.isFavorite);
    return Scaffold(
      backgroundColor: Color.fromRGBO(228, 229, 232, 1),
      appBar: _appBar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Color.fromRGBO(228, 229, 232, 1),
              margin: const EdgeInsets.only(
                top: 20.0,
                left: 22.0,
                right: 22.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Container(
                          width: 200,
                          child: Text(
                            sneaker.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'RobotoCondensed',
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Market Price',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'RobotoCondensed',
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            '\$${sneaker.marketPrice}',
                            style: TextStyle(
                              fontSize: 22,
                              fontFamily: 'RobotoCondensed',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Stack(
                    children: [
                      Image.asset(
                        sneaker.imageUrl,
                        fit: BoxFit.fitWidth,
                        color: Color.fromRGBO(228, 229, 232, 1),
                        colorBlendMode: BlendMode.darken,
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
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              elevation: 40,
              child: Container(
                height: (mediaQuery.size.height -
                        _appBar.preferredSize.height -
                        mediaQuery.padding.top) *
                    0.7,
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                      height: 100,
                      child: Image.asset(
                        'assets/images/jumpman_logo.jpg',
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Color Code:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            sneaker.colorWay,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 30.0,
                      ),
                      child: Text(
                        lipsum.createParagraph(
                          numParagraphs: 1,
                          numSentences: 3,
                        ),
                        style: TextStyle(
                          fontSize: 19,
                        ),
                      ),
                    ),
                    RichText(
                      text: new TextSpan(
                        style: new TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          new TextSpan(
                              text: 'This pair of sneakers was released on '),
                          new TextSpan(
                              text:
                                  '${DateFormat.yMMMd().format(sneaker.releaseDate)}',
                              style:
                                  new TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        top: 30.0,
                        left: 30.0,
                        right: 30.0,
                      ),
                      height: 75,
                      width: double.infinity,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: sizes.length,
                        itemBuilder: (ctx, idx) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                            ),
                          ),
                          child: Text(
                            sizes[idx].toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'RobotoCondensed',
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Container(
                          //color: Colors.blue,
                          height: 60,
                          width: 380,
                          child: Row(
                            children: [
                              ButtonTheme(
                                minWidth: 190,
                                height: 60,
                                child: RaisedButton(
                                  color: Colors.red[900],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15.0),
                                      bottomLeft: Radius.circular(15.0),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    'Make an Offer',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              ButtonTheme(
                                minWidth: 190,
                                height: 60,
                                child: RaisedButton(
                                  color: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(15.0),
                                      bottomRight: Radius.circular(15.0),
                                    ),
                                  ),
                                  onPressed: () {
                                    cart.addItem(sneaker.id, sneaker.name,
                                        sneaker.marketPrice, sneaker.imageUrl);
                                  },
                                  child: Text(
                                    'Add to Cart',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 35.0,
                          width: 35.0,
                          child: Text(
                            'OR',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          padding: const EdgeInsets.only(top: 9.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.7),
                                spreadRadius: 2,
                                blurRadius: 7,
                                offset: Offset(0.5, 0.5),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
