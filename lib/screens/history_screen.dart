import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../widgets/footer.dart';
import '../l10n/app_dictionary.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildHeroSection(context),
          _buildTimeline(context),
          _buildFacts(context),
          const SizedBox(height: 40),
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
            AppColors.dark.withOpacity(0.6),
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
            AppDictionary.tr(context, 'hist_title'),
            style: GoogleFonts.playfairDisplay(
              color: AppColors.gold,
              fontSize: 42,
              height: 1.1,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            AppDictionary.tr(context, 'hist_subtitle'),
            style: GoogleFonts.crimsonPro(
              color: AppColors.cream,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeline(BuildContext context) {
    return Container(
      color: AppColors.dark,
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          _buildTimelineItem(
            AppDictionary.tr(context, 'hist_era1_year'),
            AppDictionary.tr(context, 'hist_era1_title'),
            AppDictionary.tr(context, 'hist_era1_desc'),
          ),
          _buildTimelineItem(
            AppDictionary.tr(context, 'hist_era2_year'),
            AppDictionary.tr(context, 'hist_era2_title'),
            AppDictionary.tr(context, 'hist_era2_desc'),
          ),
          _buildTimelineItem(
            AppDictionary.tr(context, 'hist_era3_year'),
            AppDictionary.tr(context, 'hist_era3_title'),
            AppDictionary.tr(context, 'hist_era3_desc'),
          ),
          _buildTimelineItem(
            AppDictionary.tr(context, 'hist_era4_year'),
            AppDictionary.tr(context, 'hist_era4_title'),
            AppDictionary.tr(context, 'hist_era4_desc'),
          ),
          _buildTimelineItem(
            AppDictionary.tr(context, 'hist_era5_year'),
            AppDictionary.tr(context, 'hist_era5_title'),
            AppDictionary.tr(context, 'hist_era5_desc'),
            isLast: true,
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineItem(String year, String title, String desc,
      {bool isLast = false}) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: AppColors.terracotta,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.gold, width: 2),
                ),
                margin: const EdgeInsets.only(top: 4),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    color: AppColors.gold.withOpacity(0.5),
                    margin: const EdgeInsets.symmetric(vertical: 4),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    year,
                    style: GoogleFonts.spaceMono(
                      color: AppColors.gold,
                      fontSize: 12,
                      letterSpacing: 2.0,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    title,
                    style: GoogleFonts.playfairDisplay(
                      color: AppColors.cream,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    desc,
                    style: GoogleFonts.crimsonPro(
                      color: AppColors.cream.withOpacity(0.7),
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFacts(BuildContext context) {
    return Container(
      color: AppColors.darkMid,
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          _buildFactCard('±479', AppDictionary.tr(context, 'hist_fact_age')),
          const SizedBox(height: 16),
          _buildFactCard('3 Ha', AppDictionary.tr(context, 'hist_fact_area')),
          const SizedBox(height: 16),
          _buildFactCard('16', AppDictionary.tr(context, 'hist_fact_buildings')),
        ],
      ),
    );
  }

  Widget _buildFactCard(String number, String desc) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.gold.withOpacity(0.05),
        border: Border.all(color: AppColors.gold.withOpacity(0.15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            number,
            style: GoogleFonts.playfairDisplay(
              color: AppColors.terracotta,
              fontSize: 48,
              fontWeight: FontWeight.w900,
              height: 1.0,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            desc.toUpperCase(),
            style: GoogleFonts.spaceMono(
              color: AppColors.cream.withOpacity(0.5),
              fontSize: 10,
              letterSpacing: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
