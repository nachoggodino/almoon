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
  const InspirationScreen(
      {super.key, this.isGalleryMode = false, required this.inspiration});
  final bool isGalleryMode;
  final Inspiration inspiration;

  @override
  State<InspirationScreen> createState() => _InspirationScreenState();
}

class _InspirationScreenState extends State<InspirationScreen> {
  late Inspiration _inspiration;
  int _dayMultiplier = Jiffy.now().dayOfYear ~/ inspirations.length;

  @override
  void initState() {
    super.initState();
    _inspiration = widget.inspiration;
  }

  @override
  Widget build(BuildContext context) {
    int dayOfYear = _inspiration.id + (_dayMultiplier * inspirations.length);
    return Scaffold(
      body: Stack(
        children: [
          InspirationFullscreenItem(inspiration: _inspiration),
          if (!widget.isGalleryMode)
            Align(
              alignment: Alignment.topRight,
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 4,
                  vertical: MediaQuery.of(context).viewPadding.top + 12,
                ),
                child: CustomElevatedButton(
                  icon: const Icon(Icons.lens_blur_rounded),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => const GalleryScreen(),
                    ));
                  },
                ),
              ),
            ),
          if (widget.isGalleryMode)
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 4,
                  vertical: MediaQuery.of(context).viewPadding.top + 12,
                ),
                child: CustomElevatedButton(
                  icon: const Icon(Icons.arrow_back_rounded),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
          if (!widget.isGalleryMode)
            Align(
              alignment: Alignment.topRight,
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 4,
                  vertical: MediaQuery.of(context).viewPadding.top + 62,
                ),
                child: CustomElevatedButton(
                  icon: const Icon(Icons.all_inclusive_rounded),
                  onPressed: () {
                    setState(() {
                      _inspiration =
                          inspirations[_random.nextInt(inspirations.length)];
                      _dayMultiplier = _random.nextInt(2); // TODO Until 184
                    });
                  },
                ),
              ),
            ),
          if (!widget.isGalleryMode)
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: MediaQuery.of(context).viewPadding.bottom,
                ),
                child: Text(
                  '${_inspiration.id} · ${Jiffy.parse(
                    '$dayOfYear-${Jiffy.now().year}',
                    pattern: 'D-yyyy',
                  ).yMMMMd}',
                  style: GoogleFonts.zenLoop(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
