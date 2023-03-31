import 'package:flutter/material.dart';
import 'package:wallpics_plus/screens/home/home_view.dart';
import 'package:wallpics_plus/dependency/dependencies.dart' as di;

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Quicksand",
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xffFFEA00),
          onPrimary: Color(0xff000918),
          secondary: Color(0xffF3F3F3),
          onSecondary: Color(0xff000918),
          error: Colors.red,
          onError: Colors.white,
          background: Color(0xff000918),
          onBackground: Colors.white,
          surface: Color(0xff000918),
          onSurface: Colors.white,
        ),
        scaffoldBackgroundColor: const Color(0xff000918),
      ),
      home: const HomeView(),
    );
  }
}
