import 'package:flutter/material.dart';
import 'package:latihan_8/HalamanProduct.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Product App",
      home:HalamanProduk(),
    );
  }
}

