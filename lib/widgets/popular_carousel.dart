import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/sneakers.dart';
import './popular_item.dart';

class PopularCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sneakerData = Provider.of<Sneakers>(context);
    final popularSnkrs = sneakerData.popularSneakers;
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, idx) => ChangeNotifierProvider.value(
          value: popularSnkrs[idx],
          child: PopularItem(
              // popularSnkrs[idx].name,
              // popularSnkrs[idx].imageUrl,
              ),
        ),
        itemCount: popularSnkrs.length,
      ),
    );
  }
}
