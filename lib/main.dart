import 'package:flutter/material.dart';
import 'inspiration_screen.dart'; // Importa el componente InspirationScreen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: Theme.of(context).colorScheme.copyWith(
          background: const Color.fromARGB(255, 27, 27, 27),
          primary: const Color.fromARGB(255, 210, 175, 255),
        )
      ),
      home: const InspirationScreen(),
    );
  }
}