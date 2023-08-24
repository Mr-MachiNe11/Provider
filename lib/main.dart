import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/provider/count_provider.dart';
import 'package:provider_practice/provider/favourite_provider.dart';
import 'package:provider_practice/provider/slider_provider.dart';
import 'package:provider_practice/screen/dark_screen.dart';
import 'favourite/favourite_screen.dart';
import 'provider/dark_provider.dart';
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
          ChangeNotifierProvider(create: (_) => DarkThemeProvider()),
        ],
        child: Builder(builder: (BuildContext context) {
          final themeChanger = Provider.of<DarkThemeProvider>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData.light(),
            darkTheme: ThemeData(
                brightness: Brightness.dark,
                appBarTheme: const AppBarTheme(
                  color: Colors.teal,
                ),
                iconTheme: const IconThemeData(
                  color: Colors.pink,
                )),
            themeMode: themeChanger.themeMode,
            home: const DarkScreen(),
          );
        }));
  }
}
