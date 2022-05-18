import 'package:chatapp/core/models/auth_form_data.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  final _formData = AuthFormData();

  void _submit() {
    _formKey.currentState?.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                if (_formData.isSignup)
                  TextFormField(
                    key: ValueKey('name'),
                    initialValue: _formData.name,
                    onChanged: (name) => _formData.name = name,
                    decoration: InputDecoration(labelText: 'Nome'),
                  ),
                TextFormField(
                  key: ValueKey('email'),
                  initialValue: _formData.email,
                  onChanged: (email) => _formData.email = email,
                  decoration: InputDecoration(labelText: 'E-mail'),
                ),
                TextFormField(
                  key: ValueKey('password'),
                  initialValue: _formData.password,
                  obscureText: true,
                  onChanged: (password) => _formData.password = password,
                  decoration: InputDecoration(labelText: 'Senha'),
                ),
                SizedBox(
                  height: 12,
                ),
                ElevatedButton(
                    onPressed: _submit,
                    child:
                        _formData.isLogin ? Text('entrar') : Text('cadastrar')),
                TextButton(
                    child: _formData.isLogin
                        ? Text('criar uma nova conta')
                        : Text('ja possui uma conta ?'),
                    onPressed: () {
                      setState(() {
                        _formData.toggleAuthMode();
                      });
                    })
              ],
            )),
      ),
    );
  }
}
