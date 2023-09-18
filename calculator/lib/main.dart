import 'package:flutter/material.dart';
import 'Home/main_home_page.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MyCalc(),
      ),
    ),
  );
}