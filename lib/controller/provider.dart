import 'package:flutter/material.dart';
import 'package:products/controller/models.dart';

import '../UI/theme.dart';

class AppProvider extends ChangeNotifier {
  bool _lightTheme = true;
  bool get isLightTheme => _lightTheme;
  changeTheme() {
    _lightTheme = !_lightTheme;

    notifyListeners();
  }

  bool _isArabic = true;
  bool get isArabic => _isArabic;
  changeLocale(bool value) {
    _isArabic = value;

    notifyListeners();
  }

  Product cuurentProduct = Product(
      id: 0,
      title: '',
      price: 0,
      description: '',
      category: '',
      image: '',
      rating: Rating(rate: 0, count: 0));
}
