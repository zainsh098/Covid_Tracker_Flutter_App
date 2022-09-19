import 'package:covid_tracker_app/Screens/SplashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid Tracker App ',
      theme: ThemeData(
            brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      home: SplasScreen(),
    );
  }
}
