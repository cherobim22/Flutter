import 'package:basicapp/screens/auth_screen.dart';
import 'package:flutter/material.dart';
import 'models/auth.dart';
import 'screens/categories_meals_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/tabs_screen.dart';
import 'screens/auth_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => Auth())],
      child: MaterialApp(
        title: 'Vamos Cozinhar?',
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
          fontFamily: 'Raleway',
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                ),
              ),
        ),
        routes: {
          '/': (context) => AuthScreen(),
          '/home': (context) => TabsScreen(),
          '/categories-meals': (context) => CategoresMealsScreen(),
          '/meal-details': (context) => MealDeatilScreen()
        },
      ),
    );
  }
}
