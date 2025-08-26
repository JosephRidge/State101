import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
 * USING PROVIDERS: 
 * Define Provider
 * You register the provider inside the multiprovder widget
 * wrap the elements that use the provider inside a consumer
 * 
 */

/// PARTS OF A PROVIDER
/// - inherits the ChangeNotifier
/// - composed of the state (data)
/// - Methods to manipulate that state (functions)


class CountProvider extends ChangeNotifier {
  // state
  int number = 10;

  // methods to mutate it
  void add() {
    number++;
    notifyListeners(); // tell the consumer to trigger a rebuild
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer<CountProvider>(
      builder: (build, countProvider, child) {
        return Container(
          child: Row(
            children: [
              Text(countProvider.number.toString()),
              TextButton(
                onPressed: () {
                  countProvider.add();
                },
                child: Text("add one"),
              ),
            ],
          ),
        );
      },
    ),
    Consumer<NumbersProvider>(
      builder: (build, numbersProvider, child) {
        return Container(
          child: Row(
            children: [
              Text(numbersProvider.numbers.toString()),
              TextButton(
                onPressed: () {
                  numbersProvider.increment();
                },
                child: Text("add one"),
              ),
            ],
          ),
        );
      },
    )
      ],
    );
  }
}
