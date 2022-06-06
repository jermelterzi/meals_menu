import 'package:flutter/material.dart';
import 'package:meals/pages/categories_page.dart';
import 'package:meals/pages/config_page.dart';
import 'package:meals/pages/meal_detail_page.dart';
import 'package:meals/pages/meals_page.dart';
import 'package:meals/pages/tabs_page.dart';
import 'package:meals/utils/app_routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
        AppRoutes.MEALS_PAGE: (ctx) => const MealsPage(),
        AppRoutes.MEAL_DETAIL: (ctx) => const MealDetailPage(),
        AppRoutes.CONFIG_PAGE: (ctx) => const ConfigPage(),
      },
      // onGenerateRoute: ,
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (_) => const CategoriesPage());
      },
    );
  }
}
