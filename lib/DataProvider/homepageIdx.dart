import 'package:flutter/material.dart';

class HomeTopIdx with ChangeNotifier {
  int _index = 0;
  get index => _index == null ? 0 : _index;

  HomeTopIdx({int index}) {
    this._index = index;
  }

  topIndexChang(int idx) {
    _index = idx;
    notifyListeners();
  }
}
