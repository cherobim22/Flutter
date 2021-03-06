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
      body: Column(children: [
        Container(
          height: 300,
          width: double.infinity,
          child: Image.network(
            meal.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'Ingredientes',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Container(
          width: 300,
          height: 300,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.black12,
              border: Border.all(color: Colors.blue),
              borderRadius: BorderRadius.circular(10)),
          child: ListView.builder(
            itemCount: meal.ingredients.length,
            itemBuilder: (context, index) {
              return Card(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text(meal.ingredients[index]),
                ),
                // color: Theme.of(context).accentColor,
              );
            },
          ),
        )
      ]),
    );
  }
}
