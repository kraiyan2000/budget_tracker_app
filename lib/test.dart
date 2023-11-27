import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('White Border Input'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white, // Set the border color to white
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white, // Set the border color to white
                  ),
                ),
                hintText: 'Type something...',
                hintStyle: TextStyle(
                  color: Colors.white54, // Set the hint text color to a lighter shade
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
