import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/provider/count_provider.dart';
import 'package:provider_practice/provider/favourite_provider.dart';
import 'package:provider_practice/provider/slider_provider.dart';
import 'favourite/favourite_screen.dart';
import 'screen/count_screen.dart';
import 'screen/slider_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) => SliderProvider()),
        ChangeNotifierProvider(create: (_) => FavouriteProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FavouriteScreen(),
      ),
    );
  }
}
