import 'package:al_moon/model/inspiration_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jiffy/jiffy.dart';
import 'screens/inspiration_screen.dart'; // Importa el componente InspirationScreen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
        systemNavigationBarColor: const Color.fromARGB(255, 27, 27, 27)));
    return MaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: Theme.of(context).colorScheme.copyWith(
                background: const Color.fromARGB(255, 27, 27, 27),
                primary: const Color.fromARGB(255, 197, 182, 201),
                primaryContainer: const Color.fromARGB(255, 49, 41, 59),
              )),
      home: InspirationScreen(
          inspiration:
              inspirations[(Jiffy.now().dayOfYear - 1) % inspirations.length]),
    );
  }
}
