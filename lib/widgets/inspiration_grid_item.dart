import 'package:al_moon/model/inspiration.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InspirationGridItem extends StatelessWidget {
  const InspirationGridItem({
    super.key,
    required this.inspiration,
    required this.onSelectInspiration,
  });

  final Inspiration inspiration;
  final void Function() onSelectInspiration;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelectInspiration,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: AssetImage(inspiration.image),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
                gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black,
                    ]),
              ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(
                textAlign: TextAlign.center,
                inspiration.text,
                style: GoogleFonts.zenLoop(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
