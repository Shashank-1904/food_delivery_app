import 'package:equatable/equatable.dart';
import '../../models/menu_item.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => [];
}

class AddItem extends CartEvent {
  final MenuItem item;
  const AddItem(this.item);

  @override
  List<Object?> get props => [item];
}

class RemoveItem extends CartEvent {
  final MenuItem item;
  const RemoveItem(this.item);

  @override
  List<Object?> get props => [item];
}

class IncreaseQuantity extends CartEvent {
  final MenuItem item;
  const IncreaseQuantity(this.item);

  @override
  List<Object?> get props => [item];
}

class DecreaseQuantity extends CartEvent {
  final MenuItem item;
  const DecreaseQuantity(this.item);

  @override
  List<Object?> get props => [item];
}

class RemoveAllItems extends CartEvent {
  const RemoveAllItems();

  @override
  List<Object?> get props => [];
}
