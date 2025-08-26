import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state101/pages/secondPage/second_page.dart';
import 'package:state101/utility/providers/numbers_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Consumer<NumbersProvider>(
      builder: (context, numbersProvider, child) {
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
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () {
                  numbersProvider.increment();
                },
                child: Icon(Icons.add),
              ),
              SizedBox(height: 10),
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(builder: (context) => SecondPage()),
                  );
                },
                icon: Icon(Icons.next_plan),
              ),
            ],
          ),
        );
      },
    );
  }
}
