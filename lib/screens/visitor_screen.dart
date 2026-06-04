import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../widgets/footer.dart';
import '../l10n/app_dictionary.dart';

class VisitorScreen extends StatelessWidget {
  const VisitorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildHeroSection(context),
          Container(
            color: AppColors.cream,
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                _buildInfoBlock(
                  context,
                  '🕐',
                  AppDictionary.tr(context, 'vis_op_hours_title'),
                  [
                    _buildInfoRow(context, '📅', AppDictionary.tr(context, 'vis_weekday'), '08:00 – 18:00 WITA'),
                    _buildInfoRow(context, '📅', AppDictionary.tr(context, 'vis_weekend'), '07:00 – 19:00 WITA'),
                    _buildInfoRow(context, '⚠️', AppDictionary.tr(context, 'vis_note'), AppDictionary.tr(context, 'vis_note_desc'), isWarning: true),
                  ],
                ),
                const SizedBox(height: 24),
                _buildInfoBlock(
                  context,
                  '🎟',
                  AppDictionary.tr(context, 'vis_ticket_title'),
                  [
                    _buildTicketRow(context, AppDictionary.tr(context, 'vis_ticket_child'), 'Rp 2.000'),
                    _buildTicketRow(context, AppDictionary.tr(context, 'vis_ticket_student'), 'Rp 5.000'),
                    _buildTicketRow(context, AppDictionary.tr(context, 'vis_ticket_adult'), 'Rp 10.000'),
                    _buildTicketRow(context, AppDictionary.tr(context, 'vis_ticket_foreigner'), 'Rp 25.000'),
                    _buildTicketRow(context, AppDictionary.tr(context, 'vis_ticket_group'), AppDictionary.tr(context, 'vis_ticket_discount')),
                  ],
                ),
                const SizedBox(height: 24),
                _buildInfoBlock(
                  context,
                  '🚗',
                  AppDictionary.tr(context, 'vis_access_title'),
                  [
                    _buildInfoRow(context, '📍', AppDictionary.tr(context, 'vis_address_label'), AppDictionary.tr(context, 'vis_address_val')),
                    _buildInfoRow(context, '🚌', AppDictionary.tr(context, 'vis_transit_label'), AppDictionary.tr(context, 'vis_transit_val')),
                    _buildInfoRow(context, '🛵', AppDictionary.tr(context, 'vis_ride_label'), AppDictionary.tr(context, 'vis_ride_val')),
                  ],
                ),
                const SizedBox(height: 24),
                _buildRulesBlock(context),
              ],
            ),
          ),
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
        image: DecorationImage(
          image: const NetworkImage(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/Fort_Rotterdam_Makassar.jpg/1280px-Fort_Rotterdam_Makassar.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            AppColors.terracottaDark.withOpacity(0.8),
            BlendMode.srcOver,
          ),
        ),
      ),
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppDictionary.tr(context, 'vis_info_header'),
            style: GoogleFonts.spaceMono(
              color: AppColors.gold,
              fontSize: 10,
              letterSpacing: 2.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            AppDictionary.tr(context, 'vis_plan_visit'),
            style: GoogleFonts.playfairDisplay(
              color: AppColors.cream,
              fontSize: 32,
              height: 1.1,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoBlock(BuildContext context, String icon, String title, List<Widget> children) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.creamDark),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(icon, style: const TextStyle(fontSize: 20)),
              const SizedBox(width: 8),
              Text(
                title,
                style: GoogleFonts.playfairDisplay(
                  color: AppColors.dark,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            height: 2,
            width: double.infinity,
            color: AppColors.terracotta,
            margin: const EdgeInsets.only(bottom: 16),
          ),
          ...children,
        ],
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, String icon, String label, String value,
      {bool isWarning = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(icon, style: const TextStyle(fontSize: 16)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label.toUpperCase(),
                  style: GoogleFonts.spaceMono(
                    color: AppColors.stone,
                    fontSize: 10,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: GoogleFonts.crimsonPro(
                    color: isWarning ? AppColors.terracottaDark : AppColors.textBody,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTicketRow(BuildContext context, String category, String price) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            category,
            style: GoogleFonts.crimsonPro(
              color: AppColors.textBody,
              fontSize: 16,
            ),
          ),
          Text(
            price,
            style: GoogleFonts.crimsonPro(
              color: AppColors.terracottaDark,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRulesBlock(BuildContext context) {
    final rules = [
      AppDictionary.tr(context, 'vis_rule_food'),
      AppDictionary.tr(context, 'vis_rule_touch'),
      AppDictionary.tr(context, 'vis_rule_litter'),
      AppDictionary.tr(context, 'vis_rule_pets'),
    ];

    return _buildInfoBlock(
      context,
      '📋',
      AppDictionary.tr(context, 'vis_rules_title'),
      rules
          .map((rule) => Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('✗',
                        style: TextStyle(
                            color: AppColors.terracotta,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        rule,
                        style: GoogleFonts.crimsonPro(
                          color: AppColors.textBody,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ))
          .toList(),
    );
  }
}
