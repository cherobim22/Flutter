import 'dart:convert';

import 'package:basicapp/exceptions/auth_exception.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class User with ChangeNotifier {
  String _token;
  List data = [];
  User(this._token, this.data);
}
