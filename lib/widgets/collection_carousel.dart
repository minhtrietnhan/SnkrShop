import 'package:RealSnkrShop/screens/sneaker_overview_screen.dart';
import 'package:flutter/material.dart';
import 'package:numerus/numerus.dart';

class CollectionCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.blue,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: 12,
        itemBuilder: (ctx, idx) => GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed(SneakerOverviewScreen.routeName, arguments: idx + 1);
          },
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListTile(
                leading: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 3,
                  ),
                  child: CircleAvatar(
                    radius: 30,
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/jumpman_logo.jpg',
                        fit: BoxFit.cover,
                        width: 50,
                        height: 50,
                      ),
                    ),

                    //child: Text('test'),
                  ),
                ),
                title: Text(
                  'Air Jordan ${(idx + 1).toRomanNumeralString()}',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Raleway',
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
