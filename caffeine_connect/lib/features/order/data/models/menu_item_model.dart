import 'package:caffeine_connect/core/utils/assets_manager.dart';
import 'package:caffeine_connect/core/utils/strings_manager.dart';

class MenuItem {
  final String name;
  final double price;
  final String image;

  MenuItem({
    required this.name,
    required this.price,
    required this.image,
  });
}

List<MenuItem> menuItems = [
  MenuItem(
    name: StringsManager.americano,
    price: 2.5,
    image: AssetsManager.americano,
  ),
  MenuItem(
    name: StringsManager.cappuccino,
    price: 4.0,
    image: AssetsManager.cappuccino,
  ),
  MenuItem(
    name: StringsManager.espresso,
    price: 5.0,
    image: AssetsManager.espresso,
  ),
  MenuItem(
    name: StringsManager.flatWhite,
    price: 3.5,
    image: AssetsManager.flatWhite,
  ),
  MenuItem(
    name: StringsManager.latte,
    price: 2.75,
    image: AssetsManager.latte,
  ),
  MenuItem(
    name: StringsManager.raf,
    price: 3.5,
    image: AssetsManager.raf,
  ),
];
