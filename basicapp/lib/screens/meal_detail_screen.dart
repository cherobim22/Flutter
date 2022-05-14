import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealDeatilScreen extends StatelessWidget {
  const MealDeatilScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)?.settings.arguments as Meal;
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: Center(child: Text(meal.id)),
    );
  }
}
