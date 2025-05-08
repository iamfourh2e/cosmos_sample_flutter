import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier{
  String _url = "";
  get url => _url;
  final Env env;
  AppProvider({required this.env}) {
    if (env == Env.dev) {
      _url = "dev url";
    }else{
      _url = "pro url";
    }

  }
}


enum Env {
  prod,
  dev
}