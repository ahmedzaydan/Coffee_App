import 'package:caffeine_connect/core/utils/strings_manager.dart';
import 'package:caffeine_connect/features/order/data/models/barista_model.dart';

class OrderModel {
  final String name;
  final double price;
  final String image;
  final int ristretto;
  final bool takeAway;
  final int volume;
  final DateTime? preparationTime;
  final int quantity;
  final CoffeeLoverAssemblageModel? coffeeLoverAssemblage;

  OrderModel({
    required this.name,
    required this.price,
    required this.image,
    required this.ristretto,
    required this.takeAway,
    this.volume = 350,
    this.preparationTime,
    this.quantity = 1,
    this.coffeeLoverAssemblage,
  });
}

class CoffeeLoverAssemblageModel {
  final Barista barista;
  final String coffeeType;
  final String coffeeSort;
  final int roastingLevel;
  final int grindingLevel;
  final String milkType;
  final String syrupType;
  final List<String>? additives;
  final int iceQuantity;

  CoffeeLoverAssemblageModel({
    required this.barista,
    required this.coffeeType,
    required this.coffeeSort,
    this.roastingLevel = 3,
    this.grindingLevel = 2,
    this.milkType = StringsManager.none, // TODO: change to none
    this.syrupType = StringsManager.none, // TODO: change to none
    this.additives,
    this.iceQuantity = 2,
  });
}
