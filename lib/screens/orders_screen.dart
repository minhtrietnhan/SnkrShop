import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/orders.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = 'orders-screen';
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final orders = Provider.of<Orders>(context);
    final _appBar = AppBar(
      leading: BackButton(
        color: Colors.white,
      ),
      title: Text(
        'Sneaker Shop',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.black,
      elevation: 0.0,
    );
    return Scaffold(
      appBar: _appBar,
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 20.0,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                'Orders',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              height: (mediaQuery.size.height -
                      _appBar.preferredSize.height -
                      mediaQuery.padding.top) *
                  0.58,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: orders.orderCount,
                itemBuilder: (ctx, idx) => Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Card(
                    child: Column(
                      children: [
                        Text('\$${orders.orders[idx].amount}'),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
