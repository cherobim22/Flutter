import 'package:chatapp/core/models/auth_form_data.dart';
import 'package:chatapp/core/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../components/auth_form.dart';
import '../core/services/auth/auth_mock_service.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _issLoading = false;
  Future<void> handleFormSubmit(AuthFormData formData) async {
    try {
      setState(() => _issLoading = true);

      if (formData.isLogin) {
        print('login');
        AuthService().login(formData.email, formData.password);
      } else {
        AuthService().signup(
          formData.name,
          formData.email,
          formData.password,
          formData.image!,
        );
      }
    } catch (error) {
      print(error);
    } finally {
      setState(() => _issLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: AuthForm(
                onSubmit: handleFormSubmit,
              ),
            ),
          ),
          if (_issLoading)
            Container(
              decoration: BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.5)),
              child: Center(child: CircularProgressIndicator()),
            )
        ],
      ),
    );
  }
}
