import 'package:flutter/material.dart';
import 'package:todo/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static _MyAppState of(BuildContext context) {
    return context.findAncestorStateOfType<_MyAppState>()!;
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode themeMode = ThemeMode.light;

  void toggleTheme(bool value) {
    setState(() {
      themeMode =
          themeMode == ThemeMode.light
              ? ThemeMode.dark
              : ThemeMode.light;
      print("themeMode $themeMode");
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo list',

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
        ),
      ),

      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 32, 21, 51),
          brightness: Brightness.dark,
        ),
      ),

      themeMode: themeMode,

      home: MyHomePage(
        title: 'Todo list',
        onToggleTheme: toggleTheme,
      ),
    );
  }

  // void toggleTheme(bool value) {
  //   setState(() {
      
  //   });
  // }
}