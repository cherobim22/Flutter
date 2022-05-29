import 'dart:math';

import 'package:basicapp/exceptions/auth_exception.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/auth.dart';

enum AuthMode { Signup, Login }

class AuthForm extends StatefulWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  AuthMode _authMode = AuthMode.Login;
  Map<String, String> _authData = {'email': '', 'password': ''};
  bool _isLogin() => _authMode == AuthMode.Login;
  bool _isSignup() => _authMode == AuthMode.Signup;
  bool _isLoading = false;

  void _switchAuthMode() {
    setState(() {
      _isLoading = false;
      if (_isLogin()) {
        _authMode = AuthMode.Signup;
      } else {
        _authMode = AuthMode.Login;
      }
    });
  }

  void _showErrorDialog(String message) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Ocorreu um erro'),
              content: Text(message),
              actions: [
                TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('Fechar'))
              ],
            ));
  }

  Future<void> _submit() async {
    final _isValid = _formKey.currentState?.validate() ?? false;
    if (!_isValid) {
      return;
    }

    _formKey.currentState?.save();

    Auth auth = Provider.of(context, listen: false);

    setState(() {
      _isLoading = true;
    });

    try {
      if (_isLogin()) {
        await auth.sigin(_authData['email']!, _authData['password']!);
        setState(() {
          _isLoading = false;
        });
      } else {
        await auth.signup(_authData['email']!, _authData['password']!);
        setState(() {
          _isLoading = false;
        });
      }
    } on AuthException catch (error) {
      _showErrorDialog(error.toString());
      setState(() {
        _isLoading = false;
      });
    } catch (error) {
      _showErrorDialog('ocorreu um erro inesperado chame o suporte');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: EdgeInsets.all(14),
        height: _isLogin() ? 310 : 400,
        width: deviceSize.width * 0.85,
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  onSaved: (email) => _authData['email'] = email ?? '',
                  decoration: InputDecoration(labelText: 'E-mail'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (_email) {
                    final email = _email ?? '';
                    if (email.trim().isEmpty || !email.contains('@')) {
                      return 'Inisira um email valido';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  onSaved: (password) => _authData['password'] = password ?? '',
                  decoration: InputDecoration(labelText: 'Senha'),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  controller: _passwordController,
                  validator: (_password) {
                    final password = _password ?? '';
                    if (password.isEmpty || password.length < 5) {
                      return 'A senha precisa ter no minimo 6 caracteres';
                    }
                    return null;
                  },
                ),
                if (_isSignup())
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Confirmar Senha'),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    validator: (_password) {
                      final password = _password ?? '';
                      if (password != _passwordController.text) {
                        return 'Senhas Não Conferem';
                      }
                      return null;
                    },
                  ),
                SizedBox(height: 20),
                if (_isLoading)
                  CircularProgressIndicator()
                else
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 8)),
                    onPressed: _submit,
                    child: Text(
                      _isLogin() ? 'ENTRAR' : 'REGISTRAR',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                Spacer(),
                TextButton(
                    onPressed: _switchAuthMode,
                    child:
                        _isLogin() ? Text('Resgistre-se') : Text('Fazer Login'))
              ],
            )),
      ),
    );
  }
}
