import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ordering_app/main.dart';
import 'package:food_ordering_app/bloc/cart/cart_bloc.dart';

void main() {
  testWidgets('Basic smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(
      BlocProvider<CartBloc>(
        create: (_) => CartBloc(),
        child: const MyApp(),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byType(MaterialApp), findsOneWidget);
    expect(find.text('Food Ordering App'), findsNothing);
  });
}
