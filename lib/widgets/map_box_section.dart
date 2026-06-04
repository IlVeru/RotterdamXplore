import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_colors.dart';

class MapBoxSection extends StatelessWidget {
  const MapBoxSection({super.key});

  Future<void> _openGoogleMaps() async {
    final Uri url = Uri.parse('https://maps.google.com/maps?q=Fort+Rotterdam+Makassar');
    if (!await launchUrl(url)) {
      debugPrint('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.dark,
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 64.0),
      child: Column(
        children: [
          Text(
            'LOKASI KAMI',
            style: GoogleFonts.spaceMono(
              color: AppColors.gold,
              fontSize: 14,
              letterSpacing: 2.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Temukan Fort Rotterdam',
            textAlign: TextAlign.center,
            style: GoogleFonts.playfairDisplay(
              color: AppColors.cream,
              fontSize: 32,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Jl. Ujung Pandang No.1, Bulo Gading, Kec. Ujung Pandang\nKota Makassar, Sulawesi Selatan 90111',
            textAlign: TextAlign.center,
            style: GoogleFonts.crimsonPro(
              color: AppColors.stone,
              fontSize: 16,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 40),
          Container(
            constraints: const BoxConstraints(maxWidth: 800),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.gold.withOpacity(0.3), width: 1),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.network(
                    'https://images.unsplash.com/photo-1524661135-423995f22d0b?q=80&w=800&auto=format&fit=crop',
                    height: 350,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    color: AppColors.terracotta.withOpacity(0.3),
                    colorBlendMode: BlendMode.colorBurn,
                  ),
                  Container(
                    height: 350,
                    color: AppColors.dark.withOpacity(0.5),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.location_on, size: 64, color: AppColors.terracotta),
                      const SizedBox(height: 24),
                      ElevatedButton.icon(
                        onPressed: _openGoogleMaps,
                        icon: const Icon(Icons.map, color: AppColors.dark),
                        label: Text(
                          'BUKA DI GOOGLE MAPS',
                          style: GoogleFonts.spaceMono(
                            color: AppColors.dark,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.gold,
                          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 8,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
