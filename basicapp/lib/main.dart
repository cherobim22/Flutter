import 'package:flutter/material.dart';
import 'models/auth.dart';
import 'models/user.dart';
import 'screens/auth_or_home_screen.dart';
import 'screens/categories_meals_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Auth()),
        ChangeNotifierProxyProvider<Auth, User>(
            create: (_) => User('', []),
            update: (context, auth, previous) {
              return User(auth.token ?? '', [auth]);
            })
      ],
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
          '/': (context) => AuhOrHomeScreen(),
          // '/auth': (context) => AuthScreen(),
          // '/home': (context) => TabsScreen(),
          '/categories-meals': (context) => CategoresMealsScreen(),
          '/meal-details': (context) => MealDeatilScreen()
        },
      ),
    );
  }
}
