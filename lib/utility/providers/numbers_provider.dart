import 'package:flutter/material.dart'; 

class NumbersProvider extends ChangeNotifier {  
  // states
  List<int> numbers = [1, 2, 3, 4];

  // methods
  void increment() {
    int number = numbers.last;
    number++; 
    numbers.add(number);
    notifyListeners();
  }
}

/**
 * 
 * Define Provider
 * You register the provider inside the multiprovder widget
 * wrap the elements that use the provider inside a consumer
 * 
 */