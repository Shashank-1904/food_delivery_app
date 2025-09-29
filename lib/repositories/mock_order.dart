import '../models/order.dart';
import '../models/cart_item.dart';
import '../models/menu_item.dart';

class MockOrders {
  static List<Order> orders = [
    Order(
      id: 1,
      items: [
        CartItem(menuItem: const MenuItem(name: "Cheese Pizza", price: 250), quantity: 1),
        CartItem(menuItem: const MenuItem(name: "Cold Coffee", price: 120), quantity: 2),
      ],
      totalPrice: 490,
      date: DateTime.now().subtract(const Duration(days: 2)),
      status: "Delivered",
    ),
    Order(
      id: 2,
      items: [
        CartItem(menuItem: const MenuItem(name: "Veg Burger", price: 150), quantity: 2),
      ],
      totalPrice: 300,
      date: DateTime.now().subtract(const Duration(days: 5)),
      status: "Pending",
    ),
    Order(
      id: 3,
      items: [
        CartItem(menuItem: const MenuItem(name: "Pasta Alfredo", price: 350), quantity: 1),
        CartItem(menuItem: const MenuItem(name: "Coke", price: 50), quantity: 2),
      ],
      totalPrice: 450,
      date: DateTime.now().subtract(const Duration(days: 1)),
      status: "Delivered",
    ),
  ];
}
