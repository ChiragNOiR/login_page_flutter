import 'package:build_fourr/data/services/fire_services.dart';
import 'package:flutter/material.dart';

class UserAuthProvider extends ChangeNotifier {
  FireService services = FireService();
  bool _isReq = false;
  bool get isReq => _isReq;

  Future<String> register({
    required String email,
    required String password,
  }) async {
    _isReq = true;
    notifyListeners();
    String getStatus = await services.registerUser(
      email: email,
      password: password,
    );
    _isReq = false;
    notifyListeners();
    return getStatus;
  }

  Future<String> signIn({
    required String email,
    required String password,
  }) async {
    _isReq = true;
    notifyListeners();
    String getStatus = await services.signIn(
      email: email,
      password: password,
    );
    _isReq = false;
    notifyListeners();
    return getStatus;
  }
}
