import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'cart_event.dart';
import 'cart_state.dart';
import '../../models/cart_item.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState()) {
    _loadCart();

    on<AddItem>((event, emit) {
      final existingIndex =
          state.items.indexWhere((cartItem) => cartItem.menuItem.name == event.item.name);

      List<CartItem> updatedItems = List.from(state.items);

      if (existingIndex >= 0) {
        final existingItem = updatedItems[existingIndex];
        updatedItems[existingIndex] =
            existingItem.copyWith(quantity: existingItem.quantity + 1);
      } else {
        updatedItems.add(CartItem(menuItem: event.item, quantity: 1));
      }

      emit(CartState(items: updatedItems));
      _saveCart(updatedItems);
    });

    on<RemoveItem>((event, emit) {
      final updatedItems =
          state.items.where((cartItem) => cartItem.menuItem.name != event.item.name).toList();
      emit(CartState(items: updatedItems));
      _saveCart(updatedItems);
    });

    on<IncreaseQuantity>((event, emit) {
      final updatedItems = state.items.map((cartItem) {
        if (cartItem.menuItem.name == event.item.name) {
          return cartItem.copyWith(quantity: cartItem.quantity + 1);
        }
        return cartItem;
      }).toList();
      emit(CartState(items: updatedItems));
      _saveCart(updatedItems);
    });

    on<DecreaseQuantity>((event, emit) {
      final updatedItems = state.items
          .map((cartItem) {
            if (cartItem.menuItem.name == event.item.name) {
              return cartItem.copyWith(quantity: cartItem.quantity - 1);
            }
            return cartItem;
          })
          .where((cartItem) => cartItem.quantity > 0)
          .toList();
      emit(CartState(items: updatedItems));
      _saveCart(updatedItems);
    });

    on<RemoveAllItems>((event, emit) {
      emit(const CartState(items: []));
      _saveCart([]);
    });
  }

  Future<void> _saveCart(List<CartItem> items) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonData = jsonEncode(items.map((e) => e.toJson()).toList());
    await prefs.setString('cart', jsonData);
  }

  Future<void> _loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('cart');
    if (data != null) {
      final List decoded = jsonDecode(data);
      final loadedItems = decoded.map((e) => CartItem.fromJson(e)).toList();
      emit(CartState(items: loadedItems));
    }
  }
}
