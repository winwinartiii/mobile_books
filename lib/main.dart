import 'package:flutter/material.dart';
import 'package:mobile_books/value/colour.dart';

import 'auth/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Kurir Pandu Logistics',
        theme: ThemeData(
          primaryColor: ColorPallete.asiaQuest_red,
          fontFamily: 'Roboto',
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const SplashScreen()
    );
  }
}
