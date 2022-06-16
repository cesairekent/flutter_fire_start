import 'package:flutter/material.dart';

class BaseVM with ChangeNotifier
{
  BaseVM();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  showLoading()
  {
    _isLoading = true;
    notifyListeners();
  }

  hideLoading()
  {
    _isLoading = false;
    notifyListeners();
  }
}