import 'package:flutter/material.dart';
import 'package:meals/components/meal_item.dart';
import 'package:meals/models/category.dart';

import '../models/meal.dart';

class MealsPage extends StatelessWidget {
  MealsPage(this.meals, {Key? key}) : super(key: key);

  List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    final Category category = ModalRoute.of(context)?.settings.arguments as Category;
    final mealsOfCategory = meals.where((meal) => meal.categories.contains(category.id)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return MealItem(meal: mealsOfCategory[index]);
      }, itemCount: mealsOfCategory.length,)
      );
  }
}
