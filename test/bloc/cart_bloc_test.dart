import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:food_ordering_app/bloc/cart/cart_bloc.dart';
import 'package:food_ordering_app/bloc/cart/cart_event.dart';
import 'package:food_ordering_app/bloc/cart/cart_state.dart';
import 'package:food_ordering_app/models/menu_item.dart';
import 'package:food_ordering_app/models/cart_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized(); // ✅ Required for SharedPreferences

  late CartBloc cartBloc;

  setUp(() {
    SharedPreferences.setMockInitialValues({}); // Mock storage
    cartBloc = CartBloc();
  });

  tearDown(() {
    cartBloc.close();
  });

  final menuItem = MenuItem(name: "Cheese Pizza", price: 250);

  group('CartBloc Tests', () {
    blocTest<CartBloc, CartState>(
      'emits CartState with 1 item when AddItem is added',
      build: () => cartBloc,
      act: (bloc) => bloc.add(AddItem(menuItem)),
      expect: () => [
        isA<CartState>().having((state) => state.items.length, 'items length', 1),
      ],
    );

    blocTest<CartBloc, CartState>(
      'emits CartState with 0 items when RemoveItem is added',
      build: () => cartBloc,
      seed: () => CartState(items: [CartItem(menuItem: menuItem, quantity: 1)]),
      act: (bloc) => bloc.add(RemoveItem(menuItem)),
      expect: () => [
        isA<CartState>().having((state) => state.items.length, 'items length', 0),
      ],
    );

    blocTest<CartBloc, CartState>(
      'calculates total price correctly after adding multiple items',
      build: () => cartBloc,
      act: (bloc) {
        bloc.add(AddItem(menuItem));
        bloc.add(AddItem(menuItem));
      },
      expect: () => [
        isA<CartState>().having((state) => state.totalPrice, 'totalPrice', 250),
        isA<CartState>().having((state) => state.totalPrice, 'totalPrice', 500),
      ],
    );
  });
}
