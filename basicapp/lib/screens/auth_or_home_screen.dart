import 'package:basicapp/screens/auth_screen.dart';
import 'package:basicapp/screens/tabs_screen.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/auth.dart';

class AuhOrHomeScreen extends StatelessWidget {
  const AuhOrHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of(context);
    return auth.isAuth ? TabsScreen() : AuthScreen();
  }
}
