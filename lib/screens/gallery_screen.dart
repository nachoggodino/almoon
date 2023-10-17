import 'package:al_moon/screens/inspiration_screen.dart';
import 'package:al_moon/widgets/custom_elevated_button.dart';
import 'package:al_moon/model/inspiration.dart';
import 'package:al_moon/model/inspiration_data.dart';
import 'package:al_moon/widgets/inspiration_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  void _selectInspiration(BuildContext context, Inspiration inspiration) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (ctx) => InspirationScreen(
        isGalleryMode: true,
        inspiration: inspiration,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).viewPadding.top),
          SizedBox(
            height: 72,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomElevatedButton(
                  icon: const Icon(Icons.arrow_back_rounded),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                Text(
                  "inspiration gallery",
                  style: GoogleFonts.zenLoop(
                    fontSize: 46,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 5 / 7,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              children: [
                for (final inspiration in inspirations)
                  InspirationGridItem(
                    inspiration: inspiration,
                    onSelectInspiration: () {
                      _selectInspiration(context, inspiration);
                    },
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
