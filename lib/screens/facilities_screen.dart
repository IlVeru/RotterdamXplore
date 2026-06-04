import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../widgets/footer.dart';
import '../l10n/app_dictionary.dart';

class FacilitiesScreen extends StatelessWidget {
  const FacilitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildHeroSection(context),
          Container(
            color: AppColors.dark,
            padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 48.0, bottom: 64.0),
            child: Column(
              children: [
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  alignment: WrapAlignment.center,
                  children: [
                    SizedBox(
                      width: 320,
                      child: _buildFacilityCard(
                        context,
                        '🅿️',
                        AppDictionary.tr(context, 'fac_parking_title'),
                        AppDictionary.tr(context, 'fac_parking_desc'),
                        true,
                      ),
                    ),
                    SizedBox(
                      width: 320,
                      child: _buildFacilityCard(
                        context,
                        '🕌',
                        AppDictionary.tr(context, 'fac_prayer_title'),
                        AppDictionary.tr(context, 'fac_prayer_desc'),
                        true,
                      ),
                    ),
                    SizedBox(
                      width: 320,
                      child: _buildFacilityCard(
                        context,
                        '🚻',
                        AppDictionary.tr(context, 'fac_toilet_title'),
                        AppDictionary.tr(context, 'fac_toilet_desc'),
                        true,
                      ),
                    ),
                    SizedBox(
                      width: 320,
                      child: _buildFacilityCard(
                        context,
                        '♿',
                        AppDictionary.tr(context, 'fac_wheelchair_title'),
                        AppDictionary.tr(context, 'fac_wheelchair_desc'),
                        false,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const AppFooter(),
        ],
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        color: AppColors.darkMid,
        image: DecorationImage(
          image: const NetworkImage(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/Fort_Rotterdam_Makassar.jpg/1280px-Fort_Rotterdam_Makassar.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            AppColors.dark.withOpacity(0.7),
            BlendMode.darken,
          ),
        ),
      ),
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppDictionary.tr(context, 'fac_title'),
            style: GoogleFonts.playfairDisplay(
              color: AppColors.gold,
              fontSize: 42,
              height: 1.1,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            AppDictionary.tr(context, 'fac_subtitle'),
            style: GoogleFonts.crimsonPro(
              color: AppColors.cream,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFacilityCard(
      BuildContext context, String icon, String title, String desc, bool isAvailable) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.cream.withOpacity(0.04),
        border: Border.all(color: AppColors.gold.withOpacity(0.12)),
      ),
      child: Column(
        children: [
          Text(icon, style: const TextStyle(fontSize: 48)),
          const SizedBox(height: 16),
          Text(
            title,
            style: GoogleFonts.playfairDisplay(
              color: AppColors.cream,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            desc,
            style: GoogleFonts.crimsonPro(
              color: AppColors.cream.withOpacity(0.7),
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: isAvailable ? Colors.green.withOpacity(0.15) : AppColors.gold.withOpacity(0.15),
              border: Border.all(
                color: isAvailable ? Colors.green.withOpacity(0.3) : AppColors.gold.withOpacity(0.3),
              ),
            ),
            child: Text(
              isAvailable
                  ? AppDictionary.tr(context, 'fac_status_available')
                  : AppDictionary.tr(context, 'fac_status_limited'),
              style: GoogleFonts.spaceMono(
                color: isAvailable ? Colors.greenAccent : AppColors.goldLight,
                fontSize: 10,
                letterSpacing: 1.5,
              ),
            ),
          )
        ],
      ),
    );
  }
}
