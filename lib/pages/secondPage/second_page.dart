import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state101/utility/providers/numbers_provider.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NumbersProvider>(
      builder: (context, numbersProvider, child){
        return Scaffold(
          appBar: AppBar(backgroundColor: Colors.amber),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text(
                textAlign: TextAlign.center,
                "This is where we are at currently ",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                numbersProvider.numbers.last.toString(),
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w200),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: numbersProvider.numbers.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsetsGeometry.all(4),
                      child: Text(
                        numbersProvider.numbers[index].toString(),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              numbersProvider.increment();
            },
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}
