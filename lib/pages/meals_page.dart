import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';

class MealsPage extends StatelessWidget {
  MealsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Category category = ModalRoute.of(context)?.settings.arguments as Category;
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: const Center(
        child: Text('Você selecionou uma refeição!'),
      ),
    );
  }
}
