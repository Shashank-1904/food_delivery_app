import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/cart/cart_bloc.dart';
import 'screens/restaurant_list_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // ✅ Ensure bindings initialized
  runApp(
    BlocProvider(
      create: (context) => CartBloc(),
      child: const MyApp(), // const constructor
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // ✅ const constructor

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Ordering App',
      theme: ThemeData(primarySwatch: Colors.red),
      home: const RestaurantListScreen(),
    );
  }
}
