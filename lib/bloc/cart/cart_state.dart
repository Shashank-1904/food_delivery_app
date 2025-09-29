import 'package:equatable/equatable.dart';
import '../../models/cart_item.dart';

class CartState extends Equatable {
  final List<CartItem> items;

  const CartState({this.items = const []});

  double get totalPrice =>
      items.fold(0, (sum, item) => sum + item.totalPrice);

  int get itemCount =>
      items.fold(0, (sum, item) => sum + item.quantity);

  @override
  List<Object?> get props => [items];
}
