import 'package:flutter/material.dart';
import './pages/Login.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.red.shade900),
      home: Login(),
    ),
  );
}
