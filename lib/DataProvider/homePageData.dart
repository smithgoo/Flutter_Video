import 'package:flutter/material.dart';

class HomePageData with ChangeNotifier {
  List _data = [];

  get data => _data;

  HomePageData({List data}) {
    this._data = data;
  }

  homePageReq(List data) {
    _data = data;
    notifyListeners();
  }
}
