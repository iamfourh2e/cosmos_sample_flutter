import 'package:east_rider/models/user.dart';
import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier{
  String _url = "";
  User? _user;
  get user => _user;
  get url => _url;
  final Env env;
  AppProvider({required this.env}) {
    if (env == Env.dev) {
      _url = "dev url";
    }else{
      _url = "pro url";
    }

  }

  setUser(User user) {
    _user = user;
    notifyListeners();
  }
}


enum Env {
  prod,
  dev
}