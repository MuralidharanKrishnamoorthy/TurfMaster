import 'package:flutter/material.dart';
import 'package:turfbooking/admin-splash/splashscreen.dart';
import 'package:turfbooking/navigation/navigatebar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {

    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/':(context)=> SplashScreen(),
        '/home': (context) => navigatebar(),

      },





    );
  }
}
