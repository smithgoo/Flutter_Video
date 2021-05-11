import 'package:flutter/material.dart';

class HomeTopIdx with ChangeNotifier {
  int _index = 0; //分类
  int _page = 0; //翻页
  get index => _index == null ? 0 : _index;
  get page => _page == null ? 0 : _page;

  HomeTopIdx({int index}) {
    this._index = index;
  }

  HomePageIdx({int page}) {
    this._page = page;
  }

  topIndexChang(int idx) {
    _index = idx;
    notifyListeners();
  }

  homePageIdxChange(int page) {
    _page = page;
    notifyListeners();
  }
}
