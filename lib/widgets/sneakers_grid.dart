import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/sneakers.dart';
import '../widgets/sneaker_item.dart';
import '../providers/sneaker.dart';

class SneakersGrid extends StatelessWidget {
  final int series;
  final bool showFavoritesOnly;
  SneakersGrid(this.series, this.showFavoritesOnly);
  @override
  Widget build(BuildContext context) {
    final sneakerData = Provider.of<Sneakers>(context);
    final sneakers = showFavoritesOnly
        ? sneakerData.getFavorites(series)
        : sneakerData.findBySeries(series);
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: sneakers.length,
      itemBuilder: (ctx, idx) => ChangeNotifierProvider<Sneaker>.value(
        value: sneakers[idx],
        child: SneakerItem(
            // sneakers[idx].name,
            // sneakers[idx].marketPrice,
            // sneakers[idx].imageUrl,
            ),
      ),
    );
  }
}
