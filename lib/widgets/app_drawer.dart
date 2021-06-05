import 'package:RealSnkrShop/screens/home_screen.dart';
import 'package:flutter/material.dart';

import '../screens/orders_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Center(
              child: Image.asset(
                'assets/images/jumpman_logo.jpg',
              ),
            ),
            Text(
              'Welcome!',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'RobotoCondensed',
              ),
            ),
            Text(
              'Home of Sneakerheads',
              style: TextStyle(fontFamily: 'Raleway', fontSize: 22),
            ),
            Divider(
              thickness: 1.0,
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.black,
                size: 30,
              ),
              title: Text(
                'Home',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(HomeScreen.routeName);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.receipt,
                color: Colors.black,
                size: 30,
              ),
              title: Text(
                'Orders',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              onTap: () {
                Navigator.of(context).pushNamed(OrdersScreen.routeName);
              },
            )
          ],
        ),
      ),
    );
  }
}
