import 'menu_item.dart';

class Restaurant {
  final String name;
  final String address;
  final List<MenuItem> menu;

  Restaurant({
    required this.name,
    required this.address,
    required this.menu,
  });
}
