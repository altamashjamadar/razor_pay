import 'package:flutter/material.dart';
import 'package:inspiration_ui/homepage.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter",
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true
      ),
      debugShowCheckedModeBanner: false,
      home: Homepage(),
      
    );
  }
}