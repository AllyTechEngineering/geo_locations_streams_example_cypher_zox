import 'package:flutter/material.dart';
import 'package:geo_locations_streams_example_cypher_zox/screens/screen_one.dart';
import 'package:geo_locations_streams_example_cypher_zox/screens/screen_three.dart';
import 'package:geo_locations_streams_example_cypher_zox/screens/screen_two.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sailboat Racing Comptuer',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      initialRoute: ScreenOne.id,
      routes: {
        ScreenOne.id: (context) => const ScreenOne(),
        ScreenTwo.id: (context) => const ScreenTwo(),
        ScreenThree.id: (context) => const ScreenThree(),
      },
    );
  }
}
