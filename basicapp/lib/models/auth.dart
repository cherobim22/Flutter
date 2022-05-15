import 'dart:convert';

import 'package:basicapp/exceptions/auth_exception.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

// https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBV83FL3LjD9bwn625PFZq8-RKoRwQzVRQ

class Auth with ChangeNotifier {
  String? _token;
  String? _email;
  String? _uuid;
  DateTime? _expireDate;

  bool get isAuth {
    final isValid = _expireDate?.isAfter(DateTime.now()) ?? false;
    return _token != null && isValid;
  }

  String? get token {
    return isAuth ? _token : null;
  }

  String? get email {
    return isAuth ? _email : null;
  }

  String? get uuid {
    return isAuth ? _uuid : null;
  }

  Future<void> signup(String email, String password) async {
    const _urlA =
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBV83FL3LjD9bwn625PFZq8-RKoRwQzVRQ';
    final response = await http.post(Uri.parse(_urlA),
        body: jsonEncode(
            {'email': email, 'password': password, 'returnSecureToken': true}));

    final body = jsonDecode(response.body);

    if (body['error'] != null) {
      throw AuthException(body['error']['message']);
    } else {
      _token = body['idToken'];
      _email = body['email'];
      _uuid = body['localId'];
      _expireDate =
          DateTime.now().add(Duration(seconds: int.parse(body['expiresIn'])));
      notifyListeners();
    }
  }

  Future<void> sigin(String email, String password) async {
    const _urlB =
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyBV83FL3LjD9bwn625PFZq8-RKoRwQzVRQ';
    final response = await http.post(Uri.parse(_urlB),
        body: jsonEncode(
            {'email': email, 'password': password, 'returnSecureToken': true}));

    final body = jsonDecode(response.body);

    if (body['error'] != null) {
      throw AuthException(body['error']['message']);
    } else {
      _token = body['idToken'];
      _email = body['email'];
      _uuid = body['localId'];
      _expireDate =
          DateTime.now().add(Duration(seconds: int.parse(body['expiresIn'])));
      notifyListeners();
    }
  }
}
