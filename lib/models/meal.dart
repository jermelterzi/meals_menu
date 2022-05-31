import 'package:meals/utils/complexity.dart';
import 'package:meals/utils/cost.dart';

class Meal {
  const Meal({required this.cost, required this.complexity, required this.id, required this.categories, required this.title, required this.imageUrl, required this.duration, required this.ingredients, required this.steps, required this.isGlutenFree, required this.isVegan, required this.isVegetarian, required this.isLactoseFree,});

  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final int duration;
  final List<String> ingredients;
  final List<String> steps;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;
  final Cost cost;
  final Complexity complexity;
}