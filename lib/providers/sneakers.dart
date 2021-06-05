import 'package:flutter/material.dart';

import '../providers/sneaker.dart';

class Sneakers with ChangeNotifier {
  List<Sneaker> _sneakers = [
    Sneaker(
      id: 'J101',
      name: 'J Balvin X Air Jordan 1 Retro High',
      releaseDate: DateTime(2020, 12, 8),
      colorWay: 'Multi Color/Black/Pink Foam',
      originalPrice: 190.0,
      marketPrice: 501.0,
      imageUrl: 'assets/images/jordan1_balvin.webp',
      isPopular: true,
    ),
    Sneaker(
      id: 'J102',
      name: 'Air Jordan 1 High OG "Metallic Gold"',
      releaseDate: DateTime(2020, 11, 30),
      colorWay: 'Black/Black/Metallic Gold',
      originalPrice: 170.0,
      marketPrice: 206.0,
      imageUrl: 'assets/images/jordan1_blackgold.webp',
    ),
    Sneaker(
      id: 'J103',
      name: 'Air Jordan 1 High OG "Court Purple"',
      releaseDate: DateTime(2020, 4, 11),
      colorWay: 'Purple/White-Black',
      originalPrice: 170.0,
      marketPrice: 206.0,
      imageUrl: 'assets/images/jordan1_courtpurple.webp',
    ),
    Sneaker(
      id: 'J104',
      name: 'Air Jordan 1 High OG "Crimson Tint"',
      releaseDate: DateTime(2019, 4, 12),
      colorWay: 'Black/Crimson Tint-White-Hyper Pink',
      originalPrice: 160.0,
      marketPrice: 310.0,
      imageUrl: 'assets/images/jordan1_crimsontint.webp',
    ),
    Sneaker(
      id: 'J105',
      name: 'Dior X Air Jordan 1 High SP',
      releaseDate: DateTime(2020, 7, 1),
      colorWay: 'Dust-White/Wolf Grey',
      originalPrice: 2200.0,
      marketPrice: 7831.0,
      imageUrl: 'assets/images/jordan1_dior.webp',
      isPopular: true,
    ),
    Sneaker(
      id: 'J106',
      name: 'Air Jordan 1 Retro High OG "Black Mocha"',
      releaseDate: DateTime(2020, 10, 31),
      colorWay: 'Sail/Dark Mocha-Black-Black',
      originalPrice: 170.0,
      marketPrice: 350.0,
      imageUrl: 'assets/images/jordan1_mocha.webp',
      isPopular: true,
    ),
    Sneaker(
      id: 'J107',
      name: 'Air Jordan 1 Retro High OG "Obsidian"',
      releaseDate: DateTime(2019, 8, 31),
      colorWay: 'Sail/Obsidian-University Blue',
      originalPrice: 160.0,
      marketPrice: 350.0,
      imageUrl: 'assets/images/jordan1_obsidian.jpg',
      isPopular: true,
    ),
    Sneaker(
      id: 'J108',
      name: 'Air Jordan 1 Retro High OG "Smoke Grey"',
      releaseDate: DateTime(2020, 7, 11),
      colorWay: 'White/Particle Grey/Varsity Red/Black',
      originalPrice: 170.0,
      marketPrice: 281.0,
      imageUrl: 'assets/images/jordan1_smokegrey.webp',
      isPopular: true,
    ),
    Sneaker(
      id: 'J109',
      name: 'Air Jordan 1 Retro High OG "Banned" (2016)',
      releaseDate: DateTime(2016, 9, 3),
      colorWay: 'Black/Varsity Red-White',
      originalPrice: 160.0,
      marketPrice: 1169.0,
      imageUrl: 'assets/images/jordan1_bredbanned.webp',
      isPopular: true,
    ),
    Sneaker(
      id: 'J109',
      name: 'Air Jordan 1 Retro High OG "Neutral Grey" (Hyper Crimson)',
      releaseDate: DateTime(2019, 1, 24),
      colorWay: 'Neutral Grey/Black-Hyper Crimson-White ',
      originalPrice: 160.0,
      marketPrice: 310.0,
      imageUrl: 'assets/images/jordan1_hypercrimson.jpg',
    ),
    Sneaker(
      id: 'J301',
      name: 'Fragment X Air Jordan 3 "White"',
      releaseDate: DateTime(2020, 9, 17),
      colorWay: 'White/Black',
      originalPrice: 200.0,
      marketPrice: 308.0,
      imageUrl: 'assets/images/jordan3_fragment.webp',
    ),
    Sneaker(
      id: 'J302',
      name: 'Air Jordan 3 Retro SE Denim "Fire Red"',
      releaseDate: DateTime(2020, 8, 27),
      colorWay: 'White/Red/Denim',
      originalPrice: 200.0,
      marketPrice: 215.0,
      imageUrl: 'assets/images/jordan3_reddenim.webp',
    ),
    Sneaker(
      id: 'J303',
      name: 'Air Jordan 3 Retro SE "Unite"',
      releaseDate: DateTime(2020, 2, 15),
      colorWay: 'Fire Red/Fire Red-Cement Grey-Black',
      originalPrice: 200.0,
      marketPrice: 185.0,
      imageUrl: 'assets/images/jordan3_redunite.webp',
    ),
    Sneaker(
      id: 'J401',
      name: 'Air Jordan 4 Retro "Black Cat"',
      releaseDate: DateTime(2020, 1, 22),
      colorWay: 'Black/Black-Light Graphite',
      originalPrice: 190.0,
      marketPrice: 419.0,
      imageUrl: 'assets/images/jordan4_blackcat.webp',
    ),
    Sneaker(
      id: 'J402',
      name: 'Air Jordan 4 Retro "Bred"',
      releaseDate: DateTime(2019, 5, 4),
      colorWay: 'Black/Cement Grey/Summit White/Fire Red',
      originalPrice: 200.0,
      marketPrice: 459.0,
      imageUrl: 'assets/images/jordan4_bred.webp',
    ),
  ];

  List<Sneaker> get popularSneakers {
    return _sneakers.where((snkr) => snkr.isPopular).toList();
  }

  Sneaker findById(String id) {
    return _sneakers.firstWhere((snkr) => snkr.id == id);
  }

  List<Sneaker> findBySeries(int series) {
    return _sneakers
        .where(
          (snkr) => snkr.id.startsWith('J$series'),
        )
        .toList();
  }

  List<Sneaker> get favoriteSneakers {
    return _sneakers.where((snkr) => snkr.isFavorite).toList();
  }

  List<Sneaker> getFavorites(int series) {
    var sneakers = findBySeries(series);
    return sneakers.where((snkr) => snkr.isFavorite).toList();
  }
}
