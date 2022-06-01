import 'package:flutter/material.dart';
import 'package:meals/components/meal_item.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';

class MealsPage extends StatelessWidget {
  MealsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Category category = ModalRoute.of(context)?.settings.arguments as Category;
    final mealsOfCategory = dummyMeals.where((meal) => meal.categories.contains(category.id)).toList();

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
