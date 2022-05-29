import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/auth.dart';

class ConfigScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of(context, listen: false);
    final name = auth.email ?? '';
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(child: Text('Usuario: ${name}')));
  }
}
