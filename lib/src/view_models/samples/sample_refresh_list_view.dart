import 'package:flutter/material.dart';

class SampleRefreshListVM with ChangeNotifier
{
  SampleRefreshListVM();

  int _count = 0;
  final List<int> _list = [];

  int get count => _count;
  List<int> get listCount => _list;

  void increment() {
    _count++;
    updateListNumber(count);
    notifyListeners();
  }

  updateListNumber(int number) {
    _list.add(number);
    notifyListeners();
  }

  void clearListNumber(){
    _list.clear();
    notifyListeners();
  }
}