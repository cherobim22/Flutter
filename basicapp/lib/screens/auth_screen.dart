import 'dart:math';
import 'package:flutter/material.dart';
import '../components/auth_form.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.blue, Colors.blueGrey],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)),
          ),
          Container(
            width: double.infinity,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 70),
                    transform: Matrix4.rotationZ(-8 * pi / 180),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.deepOrange.shade900),
                    child: Text(
                      'Minha Loja',
                      style: TextStyle(fontSize: 45, color: Colors.white),
                    ),
                  ),
                  AuthForm()
                ]),
          )
        ],
      ),
    );
  }
}
