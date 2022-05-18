import 'package:chatapp/components/user_image_picker.dart';
import 'package:chatapp/core/models/auth_form_data.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AuthForm extends StatefulWidget {
  final void Function(AuthFormData) onSubmit;
  const AuthForm({Key? key, required this.onSubmit}) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  final _formData = AuthFormData();

  void _handleImagePick(File image) {
    _formData.image = image;
  }

  void _handleErrorMessage(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      backgroundColor: Theme.of(context).errorColor,
    ));
  }

  void _submit() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) return;

    if (_formData.image == null && _formData.isSignup) {
      return _handleErrorMessage('Imagem não selecionada');
    }
    // A pagina vai fazer o submit (comunicaçao indireta)
    // Quando o componente filho passa informaçao pro pai
    // O pai passa um funçao como callback para dentro do filho
    widget.onSubmit(_formData);
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
                  UserImagePicker(
                    onImagePick: _handleImagePick,
                  ),
                if (_formData.isSignup)
                  TextFormField(
                    key: ValueKey('name'),
                    initialValue: _formData.name,
                    onChanged: (name) => _formData.name = name,
                    decoration: InputDecoration(labelText: 'Nome'),
                    validator: (_name) {
                      final name = _name ?? '';
                      if (name == '') {
                        return 'Digite um nome';
                      }
                    },
                  ),
                TextFormField(
                  key: ValueKey('email'),
                  initialValue: _formData.email,
                  onChanged: (email) => _formData.email = email,
                  decoration: InputDecoration(labelText: 'E-mail'),
                  validator: (_email) {
                    final email = _email ?? '';
                    if (email == '') {
                      return 'Digite um e-mail';
                    } else if (!email.contains('@')) {
                      return 'Digite um e-mail valido';
                    }
                  },
                ),
                TextFormField(
                  key: ValueKey('password'),
                  initialValue: _formData.password,
                  obscureText: true,
                  onChanged: (password) => _formData.password = password,
                  decoration: InputDecoration(labelText: 'Senha'),
                  validator: (_password) {
                    final password = _password ?? '';
                    if (password == '') {
                      return 'Digite uma senha';
                    } else if (password.length < 6) {
                      return 'A senha deve conter no minimo 6 digitos';
                    }
                  },
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
