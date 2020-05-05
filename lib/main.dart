import 'package:ecomapp/pages/login.dart';
import 'package:flutter/material.dart';

void main() {
  
    runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.red.shade900),
        home: Login(),
    ),
  );
}
