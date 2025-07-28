import 'package:flutter/material.dart';
import 'package:domain_layer_refactoring/pages/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      title: 'Material App',
       home: HomePage());
  }
}
