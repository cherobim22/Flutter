import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        CircularProgressIndicator(
          backgroundColor: Colors.white,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "loading page",
          style: TextStyle(color: Colors.white),
        ),
      ])),
    );
  }
}