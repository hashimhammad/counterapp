import 'package:counterapp/screen/counter_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Counter App',
      debugShowCheckedModeBanner: false,
      home: CounterScreen(),
    );
  }
}
