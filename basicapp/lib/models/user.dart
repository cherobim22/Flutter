import 'dart:convert';

import 'package:basicapp/exceptions/auth_exception.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

// https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBV83FL3LjD9bwn625PFZq8-RKoRwQzVRQ

class User with ChangeNotifier {
  String _token;
  List data = [];
  User(this._token, this.data);
}
