import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/settings.dart';
import 'package:meals/pages/categories_page.dart';
import 'package:meals/pages/config_page.dart';
import 'package:meals/pages/meal_detail_page.dart';
import 'package:meals/pages/meals_page.dart';
import 'package:meals/pages/tabs_page.dart';
import 'package:meals/utils/app_routes.dart';
import 'package:meals/models/meal.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _availableMeals = dummyMeals;
  Settings settings = Settings();

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;

      _availableMeals = dummyMeals.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;
        return !filterGluten && !filterLactose && !filterVegan && !filterVegetarian;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vamos cozinhar?',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
            .copyWith(secondary: Colors.amber),
        fontFamily: 'Raleway',
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: const TextStyle(
                fontSize: 24,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      routes: {
        AppRoutes.HOME: (ctx) => const TabsPage(),
        AppRoutes.MEALS_PAGE: (ctx) => MealsPage(_availableMeals),
        AppRoutes.MEAL_DETAIL: (ctx) => const MealDetailPage(),
        AppRoutes.CONFIG_PAGE: (ctx) => ConfigPage(onSettingsChanged: _filterMeals, settings: settings,),
      },
      // onGenerateRoute: ,
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (_) => const CategoriesPage());
      },
    );
  }
}
