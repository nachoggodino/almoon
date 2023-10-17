import 'package:al_moon/model/inspiration.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InspirationFullscreenItem extends StatelessWidget {
  const InspirationFullscreenItem({super.key, required this.inspiration});
  final Inspiration inspiration;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
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
    );
  }
}
