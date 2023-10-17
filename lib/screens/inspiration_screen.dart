import 'dart:math';

import 'package:al_moon/widgets/custom_elevated_button.dart';
import 'package:al_moon/screens/gallery_screen.dart';
import 'package:al_moon/model/inspiration.dart';
import 'package:al_moon/model/inspiration_data.dart';
import 'package:al_moon/widgets/inspiration_fullscreen_item.dart';
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
  Inspiration _inspiration =
      inspirations[Jiffy.now().dayOfYear % inspirations.length];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          InspirationFullscreenItem(inspiration: _inspiration),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 56),
              child: CustomElevatedButton(
                icon: const Icon(Icons.collections_outlined),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => const GalleryScreen(),
                    ));
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 112),
              child: CustomElevatedButton(
                icon: const Icon(Icons.all_inclusive_rounded),
                onPressed: () {
                  setState(() {
                    _inspiration =
                        inspirations[_random.nextInt(inspirations.length)];
                  });
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: MediaQuery.of(context).viewPadding.bottom,
              ),
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
