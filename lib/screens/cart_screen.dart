import 'package:RealSnkrShop/providers/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/orders.dart';

class CartScreen extends StatelessWidget {
  static const routeName = 'cart-screen';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final mediaQuery = MediaQuery.of(context);
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
      backgroundColor: Colors.black,
      appBar: _appBar,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 20.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                'Cart',
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
                itemCount: cart.itemCount,
                itemBuilder: (ctx, idx) => Dismissible(
                  key: ValueKey(
                    cart.items.values.toList()[idx].id,
                  ),
                  background: Container(
                    color: Theme.of(context).errorColor,
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 30,
                    ),
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.all(
                      20,
                    ),
                    margin: EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 7,
                    ),
                  ),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    Provider.of<Cart>(
                      context,
                      listen: false,
                    ).removeAllItem(
                      cart.items.keys.toList()[idx],
                    );
                  },
                  child: Container(
                    height: 170,
                    width: double.infinity,
                    //color: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 2,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 253, 240, 1),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Image.asset(
                              cart.items.values.toList()[idx].imageUrl,
                              width: 150,
                              height: 150,
                              fit: BoxFit.fitWidth,
                              color: Color.fromRGBO(255, 253, 240, 1),
                              colorBlendMode: BlendMode.darken,
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cart.items.values.toList()[idx].name,
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontFamily: 'Raleway',
                                ),
                              ),
                              SizedBox(height: 40.0),
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      width: 45,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        //color: Colors.lightBlueAccent,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20.0),
                                          bottomLeft: Radius.circular(20.0),
                                        ),
                                        border: Border.all(
                                            width: 1.0, color: Colors.white54),
                                      ),
                                      child: IconButton(
                                        onPressed: () {
                                          cart.removeItem(
                                              cart.items.keys.toList()[idx]);
                                        },
                                        iconSize: 18,
                                        padding: const EdgeInsets.all(1.0),
                                        icon: Icon(
                                          Icons.remove,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 45,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        //color: Colors.red,
                                        border: Border.all(
                                          color: Colors.white54,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          '${cart.items.values.toList()[idx].quantity.toString()}',
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                            fontFamily: 'Raleway',
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 45,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        //color: Colors.lightBlueAccent,
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20.0),
                                          bottomRight: Radius.circular(20.0),
                                        ),
                                        border: Border.all(
                                            width: 1.0, color: Colors.white54),
                                      ),
                                      child: IconButton(
                                        onPressed: () {
                                          cart.addItem(
                                              cart.items.keys.toList()[idx],
                                              cart.items.values
                                                  .toList()[idx]
                                                  .name,
                                              cart.items.values
                                                  .toList()[idx]
                                                  .price,
                                              cart.items.values
                                                  .toList()[idx]
                                                  .imageUrl);
                                        },
                                        iconSize: 18,
                                        padding: const EdgeInsets.all(1.0),
                                        icon: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Flexible(
                          child: Text(
                            '\$${cart.items.values.toList()[idx].price.toStringAsFixed(0)}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Colors.white,
                              fontFamily: 'RobotoCondensed',
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Delivery:',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromRGBO(128, 128, 128, 1),
                          fontFamily: 'Raleway',
                        ),
                      ),
                      Text(
                        cart.totalPrice() > 0 ? '\$ 10' : '\$ 0',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'Raleway',
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Divider(
                      color: Color.fromRGBO(128, 128, 128, 1),
                      thickness: 1,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total:',
                        style: TextStyle(
                          fontSize: 25,
                          color: Color.fromRGBO(128, 128, 128, 1),
                          fontFamily: 'Raleway',
                        ),
                      ),
                      Text(
                        cart.totalPrice() > 0
                            ? '\$ ${(cart.totalPrice() + 10).toStringAsFixed(0)}'
                            : '\$ 0',
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'Raleway',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.0),
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: RaisedButton(
                color: Color.fromRGBO(159, 147, 128, 1),
                onPressed: () {
                  cart.clear();
                  Provider.of<Orders>(context, listen: false).addOrder(
                    cart.items.values.toList(),
                    cart.totalPrice(),
                  );
                },
                child: Container(
                  height: 60.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(159, 147, 128, 1),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Center(
                    child: Text(
                      'Place Order',
                      style: TextStyle(
                          fontFamily: 'Raleway',
                          color: Colors.white,
                          fontSize: 25),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
