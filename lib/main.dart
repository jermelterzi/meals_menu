import 'package:flutter/material.dart';
import 'package:meals/pages/categories_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos cozinhar?',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CategoriesPage(),
    );
  }
}
