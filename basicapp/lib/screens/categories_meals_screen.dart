import 'package:basicapp/data/dummy_data.dart';
import 'package:flutter/material.dart';
import '../models/category.dart';
import '../components/meal_item.dart';

class CategoresMealsScreen extends StatelessWidget {
  // const CategoresMealsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as Category;

    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
          itemCount: categoryMeals.length,
          itemBuilder: ((context, index) {
            return MealItem(categoryMeals[index]);
          })),
    );
  }
}
