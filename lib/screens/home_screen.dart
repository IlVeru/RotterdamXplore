import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../widgets/footer.dart';
import '../widgets/map_box_section.dart';
import '../widgets/visitor_info_section.dart';
import '../l10n/app_dictionary.dart';

class HomeScreen extends StatelessWidget {
  final Function(int) onNavigate;

  const HomeScreen({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildHeroSection(context),
            _buildHighlightsBar(context),
            _buildAboutTeaser(context),
            _buildSpotsSection(context),
            _buildQuizCTA(context),
            const MapBoxSection(),
            const VisitorInfoSection(),
            const AppFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildQuizCTA(BuildContext context) {
    return Container(
      color: AppColors.terracotta,
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
      child: Column(
        children: [
          const Icon(Icons.emoji_events, size: 48, color: AppColors.gold),
          const SizedBox(height: 16),
          Text(
            AppDictionary.tr(context, 'quiz_title'),
            textAlign: TextAlign.center,
            style: GoogleFonts.playfairDisplay(
              color: AppColors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            AppDictionary.tr(context, 'quiz_desc'),
            textAlign: TextAlign.center,
            style: GoogleFonts.crimsonPro(
              color: AppColors.cream,
              fontSize: 18,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () => onNavigate(8),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.gold,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text(
              AppDictionary.tr(context, 'start_quiz'),
              style: GoogleFonts.spaceMono(
                color: AppColors.dark,
                fontSize: 14,
                letterSpacing: 1.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 800;

    return Container(
      height: isDesktop ? 600 : size.height * 0.85,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage('assets/images/fort rotterdam.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            AppColors.dark.withOpacity(0.4),
            BlendMode.darken,
          ),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.dark.withOpacity(0.2),
              AppColors.dark.withOpacity(0.9),
            ],
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: isDesktop ? 64.0 : 24.0,
          vertical: 48.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.gold.withOpacity(0.5)),
              ),
              child: Text(
                '🏛 MAKASSAR, SULAWESI SELATAN',
                style: GoogleFonts.spaceMono(
                  color: AppColors.gold,
                  fontSize: 10,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              AppDictionary.tr(context, 'hero_title'),
              style: GoogleFonts.playfairDisplay(
                color: AppColors.cream,
                fontSize: isDesktop ? 72 : 48,
                height: 1.1,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: 540,
              child: Text(
                AppDictionary.tr(context, 'hero_desc'),
                style: GoogleFonts.crimsonPro(
                  color: AppColors.cream.withOpacity(0.8),
                  fontSize: isDesktop ? 20 : 18,
                  height: 1.6,
                ),
              ),
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => onNavigate(3), // 3 is Eksplorasi
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.terracotta,
                    foregroundColor: AppColors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 20,
                    ),
                  ),
                  child: Text(
                    AppDictionary.tr(context, 'start_explore'),
                    style: GoogleFonts.spaceMono(
                      fontSize: 12,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                OutlinedButton(
                  onPressed: () => onNavigate(1), // 1 is History
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.cream,
                    side: BorderSide(color: AppColors.cream.withOpacity(0.5)),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 20,
                    ),
                  ),
                  child: Text(
                    AppDictionary.tr(context, 'learn_history'),
                    style: GoogleFonts.spaceMono(
                      fontSize: 12,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHighlightsBar(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;
    final children = [
      _buildHighlightItem(
        Icons.access_time,
        'JAM BUKA',
        '08:00 – 18:00',
        isDesktop,
      ),
      _buildHighlightItem(
        Icons.local_play,
        'TIKET',
        'Mulai Rp 5.000',
        isDesktop,
      ),
      _buildHighlightItem(
        Icons.account_balance,
        'BANGUNAN',
        '16 Gedung',
        isDesktop,
      ),
      _buildHighlightItem(
        Icons.calendar_today,
        'BERDIRI SEJAK',
        '± Tahun 1545',
        isDesktop,
      ),
    ];

    return Container(
      color: AppColors.dark,
      child: isDesktop
          ? Row(children: children.map((e) => Expanded(child: e)).toList())
          : Column(children: children),
    );
  }

  Widget _buildHighlightItem(
    IconData icon,
    String label,
    String value,
    bool isDesktop,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 32 : 24,
        vertical: 32,
      ),
      decoration: BoxDecoration(
        border: Border(
          right: isDesktop
              ? BorderSide(color: AppColors.gold.withOpacity(0.2))
              : BorderSide.none,
          bottom: !isDesktop
              ? BorderSide(color: AppColors.gold.withOpacity(0.2))
              : BorderSide.none,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 28, color: AppColors.gold),
          const SizedBox(height: 16),
          Text(
            label,
            style: GoogleFonts.spaceMono(
              color: AppColors.gold,
              fontSize: 10,
              letterSpacing: 1.5,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: GoogleFonts.playfairDisplay(
              color: AppColors.cream,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAboutTeaser(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;

    final imageWidget = Image.asset(
      'assets/images/fort.jpg',
      height: isDesktop ? 520 : 240,
      fit: BoxFit.cover,
      width: double.infinity,
      errorBuilder: (context, error, stackTrace) => Container(
        height: isDesktop ? 520 : 240,
        color: AppColors.darkMid,
        child: const Center(
          child: Icon(
            Icons.image_not_supported,
            color: AppColors.stone,
            size: 48,
          ),
        ),
      ),
    );

    final textWidget = Container(
      color: AppColors.darkMid,
      padding: EdgeInsets.all(isDesktop ? 64.0 : 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                width: 32,
                height: 1,
                color: AppColors.terracottaLight,
                margin: const EdgeInsets.only(right: 12),
              ),
              Text(
                AppDictionary.tr(context, 'about_subtitle'),
                style: GoogleFonts.spaceMono(
                  color: AppColors.terracottaLight,
                  fontSize: 10,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            AppDictionary.tr(context, 'about_title2'),
            style: GoogleFonts.playfairDisplay(
              color: AppColors.cream,
              fontSize: isDesktop ? 40 : 32,
              height: 1.15,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            AppDictionary.tr(context, 'about_desc'),
            style: GoogleFonts.crimsonPro(
              color: AppColors.cream.withOpacity(0.7),
              fontSize: 16,
              height: 1.75,
            ),
          ),
          const SizedBox(height: 32),
          TextButton(
            onPressed: () => onNavigate(1), // 1 is History
            style: TextButton.styleFrom(
              foregroundColor: AppColors.terracottaLight,
              padding: EdgeInsets.zero,
            ),
            child: Text(
              AppDictionary.tr(context, 'read_more'),
              style: GoogleFonts.spaceMono(
                fontSize: 12,
                letterSpacing: 1.5,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );

    if (isDesktop) {
      return IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: imageWidget),
            Expanded(child: textWidget),
          ],
        ),
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [imageWidget, textWidget],
      );
    }
  }

  Widget _buildSpotsSection(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;

    final cards = [
      HoverSpotCard(
        title: 'Museum La Galigo',
        tag: 'Museum',
        desc:
            'Museum terlengkap di Sulawesi Selatan dengan koleksi artefak budaya dan sejarah Bugis-Makassar yang sangat kaya.',
        imageUrl: 'assets/images/Lagaligo.jpeg',
        onTap: () => onNavigate(3),
      ),
      if (!isDesktop) const SizedBox(height: 24),
      HoverSpotCard(
        title: 'Ruang Tahanan Diponegoro',
        tag: 'Sejarah',
        desc:
            'Sel tempat Pangeran Diponegoro ditahan selama pengasingannya di Makassar hingga wafat tahun 1855.',
        imageUrl: 'assets/images/ruang tahanan dipenogoro.jpg',
        onTap: () => onNavigate(3),
      ),
      if (!isDesktop) const SizedBox(height: 24),
      HoverSpotCard(
        title: 'Menara Pengawas',
        tag: 'Arsitektur',
        desc:
            'Menara sudut benteng bergaya Eropa abad ke-17 yang kokoh, menawarkan panorama kota dan laut.',
        imageUrl: 'assets/images/menara.jpg',
        onTap: () => onNavigate(3),
      ),
    ];

    return Container(
      color: AppColors.cream,
      padding: EdgeInsets.all(isDesktop ? 64.0 : 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 32,
                          height: 1,
                          color: AppColors.terracotta,
                          margin: const EdgeInsets.only(right: 12),
                        ),
                        Text(
                          'TITIK MENARIK',
                          style: GoogleFonts.spaceMono(
                            color: AppColors.terracotta,
                            fontSize: 10,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Jelajahi Area\nFort Rotterdam',
                      style: GoogleFonts.playfairDisplay(
                        color: AppColors.dark,
                        fontSize: isDesktop ? 42 : 36,
                        height: 1.1,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
              if (isDesktop)
                OutlinedButton(
                  onPressed: () => onNavigate(3), // 3 is Eksplorasi
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.terracotta,
                    side: const BorderSide(color: AppColors.terracotta),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 20,
                    ),
                  ),
                  child: Text(
                    'LIHAT SEMUA',
                    style: GoogleFonts.spaceMono(
                      fontSize: 12,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 48),
          isDesktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                      cards
                          .map((e) => e is SizedBox ? e : Expanded(child: e))
                          .toList()
                          .expand(
                            (element) => [element, const SizedBox(width: 24)],
                          )
                          .toList()
                        ..removeLast(),
                )
              : Column(children: cards),
        ],
      ),
    );
  }
}

// ============================================================
// HOVER SPOT CARD — AnimatedContainer + MouseRegion
// ============================================================
class HoverSpotCard extends StatefulWidget {
  final String title;
  final String tag;
  final String desc;
  final String imageUrl;
  final VoidCallback? onTap;

  const HoverSpotCard({
    super.key,
    required this.title,
    required this.tag,
    required this.desc,
    required this.imageUrl,
    this.onTap,
  });

  @override
  State<HoverSpotCard> createState() => _HoverSpotCardState();
}

class _HoverSpotCardState extends State<HoverSpotCard>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnim;
  late Animation<double> _overlayAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 280),
      vsync: this,
    );
    _scaleAnim = Tween<double>(
      begin: 1.0,
      end: 1.06,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _overlayAnim = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onEnter(_) {
    setState(() => _isHovered = true);
    _controller.forward();
  }

  void _onExit(_) {
    setState(() => _isHovered = false);
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: _onEnter,
      onExit: _onExit,
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 280),
          curve: Curves.easeOut,
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(
              color: _isHovered ? AppColors.terracotta : AppColors.creamDark,
              width: _isHovered ? 1.5 : 1.0,
            ),
            boxShadow: [
              BoxShadow(
                color: _isHovered
                    ? AppColors.terracotta.withValues(alpha: 0.18)
                    : AppColors.terracotta.withValues(alpha: 0.05),
                blurRadius: _isHovered ? 32 : 16,
                offset: Offset(0, _isHovered ? 16 : 6),
              ),
            ],
          ),
          transform: Matrix4.translationValues(
            0.0,
            _isHovered ? -8.0 : 0.0,
            0.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ---- Image with zoom + dark overlay ----
              SizedBox(
                height: 200,
                child: ClipRect(
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      // Zooming image
                      AnimatedBuilder(
                        animation: _scaleAnim,
                        builder: (context, child) => Transform.scale(
                          scale: _scaleAnim.value,
                          child: child,
                        ),
                        child: widget.imageUrl.startsWith('assets/')
                            ? Image.asset(
                                widget.imageUrl,
                                fit: BoxFit.cover,
                                errorBuilder: (ctx, err, st) => Container(
                                  color: AppColors.darkMid,
                                  child: const Icon(
                                    Icons.image_not_supported,
                                    color: AppColors.stone,
                                    size: 48,
                                  ),
                                ),
                              )
                            : Image.network(
                                widget.imageUrl,
                                fit: BoxFit.cover,
                                errorBuilder: (ctx, err, st) => Container(
                                  color: AppColors.darkMid,
                                  child: const Icon(
                                    Icons.image_not_supported,
                                    color: AppColors.stone,
                                    size: 48,
                                  ),
                                ),
                              ),
                      ),
                      // Dark gradient overlay on hover
                      AnimatedBuilder(
                        animation: _overlayAnim,
                        builder: (context, _) => Opacity(
                          opacity: _overlayAnim.value * 0.65,
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [AppColors.dark, Colors.transparent],
                              ),
                            ),
                          ),
                        ),
                      ),
                      // "Eksplorasi →" button that appears on hover
                      AnimatedBuilder(
                        animation: _overlayAnim,
                        builder: (context, _) => Opacity(
                          opacity: _overlayAnim.value,
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 8,
                                ),
                                color: AppColors.terracotta,
                                child: Text(
                                  'EKSPLORASI →',
                                  style: GoogleFonts.spaceMono(
                                    color: AppColors.white,
                                    fontSize: 9,
                                    letterSpacing: 1.5,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // ---- Card Body ----
              AnimatedContainer(
                duration: const Duration(milliseconds: 280),
                padding: const EdgeInsets.all(24.0),
                color: _isHovered ? const Color(0xFFFDF5E8) : AppColors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Tag with animated underline bar
                    Row(
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 280),
                          width: _isHovered ? 20 : 0,
                          height: 1,
                          color: AppColors.terracotta,
                          margin: EdgeInsets.only(right: _isHovered ? 6 : 0),
                        ),
                        Text(
                          widget.tag.toUpperCase(),
                          style: GoogleFonts.spaceMono(
                            color: AppColors.terracotta,
                            fontSize: 10,
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.title,
                      style: GoogleFonts.playfairDisplay(
                        color: _isHovered
                            ? AppColors.terracottaDark
                            : AppColors.dark,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      widget.desc,
                      style: GoogleFonts.crimsonPro(
                        color: AppColors.stone,
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
