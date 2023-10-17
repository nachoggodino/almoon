import 'dart:math';

import 'package:al_moon/inspiration.dart';
import 'package:al_moon/inspiration_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final _random = Random();

class InspirationScreen extends StatefulWidget {
  const InspirationScreen({super.key});

  @override
  State<InspirationScreen> createState() => _InspirationScreenState();
}

class _InspirationScreenState extends State<InspirationScreen> {
  List<Inspiration> _inspirations = List.from(inspirations);

  @override
  Widget build(BuildContext context) {
    if (_inspirations.isEmpty) {
      _inspirations = List.from(inspirations);
    }
    final Inspiration inspiration = _inspirations[_random.nextInt(_inspirations.length)];
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: () {
          _inspirations.remove(inspiration);
          setState(() {});
        },
        child: const Icon(
          Icons.shuffle,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(inspiration.image),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Theme.of(context).colorScheme.background,
                ]),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  inspiration.text,
                  style: GoogleFonts.zenLoop(fontSize: 40, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
