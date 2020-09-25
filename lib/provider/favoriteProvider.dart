import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {
  bool _favorite = false;
  int _count = 0;

  bool get getFavorite => _favorite;
  int get getCount => _count;

  void changeFavoriteValue(bool favorite) {
    _favorite = favorite;
    notifyListeners();
  }

  void changeCountValue(int count) {
    _count = count;
    notifyListeners();
  }
}
