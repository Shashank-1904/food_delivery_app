import 'package:equatable/equatable.dart';
import 'menu_item.dart';

class CartItem extends Equatable {
  final MenuItem menuItem;
  final int quantity;

  const CartItem({required this.menuItem, required this.quantity});

  CartItem copyWith({int? quantity}) {
    return CartItem(
      menuItem: menuItem,
      quantity: quantity ?? this.quantity,
    );
  }

  double get totalPrice => menuItem.price * quantity;

  Map<String, dynamic> toJson() {
    return {
      'menuItem': menuItem.toJson(),
      'quantity': quantity,
    };
  }

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      menuItem: MenuItem.fromJson(json['menuItem']),
      quantity: json['quantity'],
    );
  }

  @override
  List<Object?> get props => [menuItem, quantity];
}
