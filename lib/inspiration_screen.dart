import 'dart:math';

import 'package:al_moon/inspiration.dart';
import 'package:al_moon/inspiration_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jiffy/jiffy.dart';

final _random = Random();

class InspirationScreen extends StatefulWidget {
  const InspirationScreen({super.key});

  @override
  State<InspirationScreen> createState() => _InspirationScreenState();
}

class _InspirationScreenState extends State<InspirationScreen> {
  Inspiration _inspiration = inspirations[Jiffy.now().dayOfYear % inspirations.length];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(_inspiration.image),
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
                padding:
                    const EdgeInsets.symmetric(vertical: 70, horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      _inspiration.text,
                      style: GoogleFonts.zenLoop(
                          fontSize: 40, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 56),
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(6),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: const Color.fromARGB(255, 44, 44, 44),
                  ),
                  child: const Icon(
                    Icons.collections_outlined,
                  )),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 112),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _inspiration =
                        inspirations[_random.nextInt(inspirations.length)];
                  });
                },
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(6),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: const Color.fromARGB(255, 44, 44, 44),
                ),
                child: const Icon(
                  Icons.all_inclusive_rounded,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Text(
                Jiffy.now().yMMMMd,
                style: GoogleFonts.zenLoop(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
