import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.dark,
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 48.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'RotterdamXplore',
            style: GoogleFonts.playfairDisplay(
              color: AppColors.gold,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Jl. Ujung Pandang, Bulo Gading, Kec. Ujung Pandang\nKota Makassar, Sulawesi Selatan 90111',
            textAlign: TextAlign.center,
            style: GoogleFonts.crimsonPro(
              color: AppColors.cream.withOpacity(0.7),
              fontSize: 16,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 32),
          Divider(color: AppColors.gold.withOpacity(0.2)),
          const SizedBox(height: 24),
          Text(
            '© ${DateTime.now().year} RotterdamXplore. All rights reserved.',
            style: GoogleFonts.spaceMono(
              color: AppColors.cream.withOpacity(0.5),
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 24), // Extra padding for the bottom navigation bar
        ],
      ),
    );
  }
}
