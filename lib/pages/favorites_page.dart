import 'package:flutter/material.dart';
import 'package:meals/components/meal_item.dart';
import 'package:meals/models/meal.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key, required this.favoriteMeals})
      : super(key: key);

  final List<Meal> favoriteMeals;

  @override
  Widget build(BuildContext context) {
    return favoriteMeals.isEmpty
        ? const Center(
            child: Text('Nenhuma refeição adicionada como favorita!'),
          )
        : ListView.builder(
            itemBuilder: (ctx, index) => MealItem(
              meal: favoriteMeals[index],
            ),
            itemCount: favoriteMeals.length,
          );
  }
}
