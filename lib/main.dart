import 'package:RealSnkrShop/providers/cart.dart';
import 'package:RealSnkrShop/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/sneakers.dart';
import './providers/orders.dart';
import './screens/sneaker_overview_screen.dart';
import './screens/home_screen.dart';
import './screens/sneaker_detail_screen.dart';
import './screens/orders_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Sneakers(),
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (_) => Orders(),
        )
      ],
      child: MaterialApp(
        title: 'Sneaker Shop',
        theme: ThemeData(
          primaryColor: Color.fromRGBO(228, 229, 232, 1),
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
        routes: {
          SneakerDetailScreen.routeName: (ctx) => SneakerDetailScreen(),
          SneakerOverviewScreen.routeName: (ctx) => SneakerOverviewScreen(),
          OrdersScreen.routeName: (ctx) => OrdersScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          HomeScreen.routeName: (ctx) => HomeScreen(),
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sneaker Shop'),
      ),
      body: Center(
        child: Text('Testing again'),
      ),
    );
  }
}
