import 'package:flutter/material.dart';
import 'package:invoice_generator/Screens/add_item.dart';
import 'package:invoice_generator/Screens/home_screen.dart';
import 'package:invoice_generator/Screens/product_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/' :(context) => HomeScreen(),
        'add' :(context) => AddItemScreen(),
        'list' :(context) => ProductList(),
      },
    );
  }
}
