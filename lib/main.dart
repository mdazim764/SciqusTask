import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'ResponsiveLayout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ResponsiveLayout(),
    );
  }
}