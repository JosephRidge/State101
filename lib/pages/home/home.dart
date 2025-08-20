import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<int> numbers = [1, 2, 3, 4];
  @override
  Widget build(BuildContext context) {
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
            numbers.last.toString(),
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w200),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsetsGeometry.all(4),
                  child: Text(
                   numbers[index].toString(),
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
