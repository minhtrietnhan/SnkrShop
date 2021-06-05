import 'package:RealSnkrShop/screens/cart_screen.dart';
import 'package:RealSnkrShop/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:numerus/numerus.dart';

import '../widgets/sneakers_grid.dart';

enum FilterOptions {
  Favorites,
  All,
}

class SneakerOverviewScreen extends StatefulWidget {
  static const routeName = 'sneaker-overview-screen';
  @override
  _SneakerOverviewScreenState createState() => _SneakerOverviewScreenState();
}

class _SneakerOverviewScreenState extends State<SneakerOverviewScreen> {
  var _showFavorites = false;
  @override
  Widget build(BuildContext context) {
    final series = ModalRoute.of(context).settings.arguments as int;
    final mediaQuery = MediaQuery.of(context);
    final _appBar = AppBar(
      title: Text('Sneaker Shop'),
      elevation: 0,
      backgroundColor: Color.fromRGBO(228, 229, 232, 1),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed(CartScreen.routeName);
          },
          icon: Icon(
            Icons.shopping_cart,
            color: Colors.black,
          ),
        ),
      ],
    );
    return Scaffold(
      appBar: _appBar,
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Container(
          color: Color.fromRGBO(228, 229, 232, 1),
          child: Column(
            children: [
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Jordan ${series.toRomanNumeralString()}',
                style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
              ),
              PopupMenuButton(
                onSelected: (FilterOptions selectedValue) {
                  if (selectedValue == FilterOptions.Favorites) {
                    setState(() {
                      _showFavorites = true;
                    });
                  } else {
                    setState(() {
                      _showFavorites = false;
                    });
                  }
                },
                icon: Icon(Icons.more_horiz),
                itemBuilder: (_) => [
                  PopupMenuItem(
                    child: Text('All sneakers'),
                    value: FilterOptions.All,
                  ),
                  PopupMenuItem(
                    child: Text('Favorites'),
                    value: FilterOptions.Favorites,
                  ),
                ],
              ),
              Container(
                height: (mediaQuery.size.height -
                        _appBar.preferredSize.height -
                        mediaQuery.padding.top) *
                    0.85,
                child: SneakersGrid(series, _showFavorites),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
