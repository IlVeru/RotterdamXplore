import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../l10n/app_dictionary.dart';

class ContactScreen extends StatefulWidget {
  final bool scrollToBooking;
  const ContactScreen({super.key, this.scrollToBooking = false});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _bookingFormKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    if (widget.scrollToBooking) {
      // Scroll to booking form after first frame renders
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollToBookingForm();
      });
    }
  }

  void _scrollToBookingForm() {
    final ctx = _bookingFormKey.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
        alignment: 0.0,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildHeroSection(context),
          Container(
            color: AppColors.cream,
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppDictionary.tr(context, 'con_header'),
                  style: GoogleFonts.playfairDisplay(
                    color: AppColors.dark,
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  AppDictionary.tr(context, 'con_desc'),
                  style: GoogleFonts.crimsonPro(
                    color: AppColors.stone,
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 32),
                LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth > 800) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildContactDetail('📍', AppDictionary.tr(context, 'con_addr'), 'Jl. Ujung Pandang No.1, Makassar'),
                                _buildContactDetail('📞', AppDictionary.tr(context, 'con_tel'), '(0411) 1234567'),
                                _buildContactDetail('✉️', AppDictionary.tr(context, 'con_email'), 'info@fortrotterdam.id'),
                              ],
                            ),
                          ),
                          const SizedBox(width: 48),
                          Expanded(
                            flex: 2,
                            child: _buildBookingForm(context),
                          ),
                        ],
                      );
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildContactDetail('📍', AppDictionary.tr(context, 'con_addr'), 'Jl. Ujung Pandang No.1, Makassar'),
                        _buildContactDetail('📞', AppDictionary.tr(context, 'con_tel'), '(0411) 1234567'),
                        _buildContactDetail('✉️', AppDictionary.tr(context, 'con_email'), 'info@fortrotterdam.id'),
                        const SizedBox(height: 40),
                        _buildBookingForm(context),
                      ],
                    );
                  }
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
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
            AppDictionary.tr(context, 'con_title'),
            style: GoogleFonts.playfairDisplay(
              color: AppColors.gold,
              fontSize: 42,
              height: 1.1,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            AppDictionary.tr(context, 'con_subtitle'),
            style: GoogleFonts.crimsonPro(
              color: AppColors.cream,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactDetail(String icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 48,
            height: 48,
            color: AppColors.terracotta,
            child: Center(child: Text(icon, style: const TextStyle(fontSize: 20))),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
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
                  color: AppColors.textBody,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBookingForm(BuildContext context) {
    return Container(
      key: _bookingFormKey,
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
              Container(
                width: 4,
                height: 28,
                color: AppColors.terracotta,
                margin: const EdgeInsets.only(right: 12),
              ),
              Text(
                AppDictionary.tr(context, 'con_form_title'),
                style: GoogleFonts.playfairDisplay(
                  color: AppColors.dark,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildTextField(AppDictionary.tr(context, 'con_form_name')),
          const SizedBox(height: 16),
          _buildTextField(AppDictionary.tr(context, 'con_form_institution')),
          const SizedBox(height: 16),
          _buildTextField(AppDictionary.tr(context, 'con_form_participants')),
          const SizedBox(height: 16),
          _buildTextField(AppDictionary.tr(context, 'con_form_date')),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.terracotta,
                foregroundColor: AppColors.white,
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: Text(
                AppDictionary.tr(context, 'con_form_submit'),
                style: GoogleFonts.spaceMono(
                  fontSize: 12,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTextField(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.spaceMono(
            color: AppColors.stone,
            fontSize: 10,
            letterSpacing: 1.5,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.cream,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(color: AppColors.creamDark),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(color: AppColors.creamDark),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(color: AppColors.terracotta),
            ),
          ),
        ),
      ],
    );
  }
}
