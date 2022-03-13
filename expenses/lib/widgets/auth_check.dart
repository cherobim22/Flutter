import 'package:expenses/main.dart';
import 'package:expenses/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../pages/login_page.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({Key? key}) : super(key: key);

  @override
  _AuthCheckState createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);

    if (auth.isLoading)
      return loading();
    else if (auth.usuario == null)
      return LoginPage();
    else
      return MyHomePage();
  }

   loading(){
     return Scaffold(
       body: Center(child: CircularProgressIndicator()),
     );
    }
}
