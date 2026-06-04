import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../widgets/footer.dart';
import '../l10n/app_dictionary.dart';

class AttractionsScreen extends StatelessWidget {
  const AttractionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildHeroSection(context),
          Container(
            color: AppColors.creamDark,
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '8 TITIK UTAMA UNTUK DIJELAJAHI',
                  style: GoogleFonts.spaceMono(
                    color: AppColors.terracotta,
                    fontSize: 18,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 16),
                _buildAttractionCard(
                  context,
                  '01',
                  'Museum Utama',
                  'Museum La Galigo',
                  'Museum terbesar di Sulawesi Selatan dengan ribuan koleksi benda-benda bersejarah.',
                  'assets/images/Lagaligo.jpeg',
                ),
                const SizedBox(height: 24),
                _buildAttractionCard(
                  context,
                  '02',
                  'Situs Bersejarah',
                  'Ruang Tahanan Pangeran Diponegoro',
                  'Sel tempat Pahlawan Nasional Pangeran Diponegoro menjalani pengasingan.',
                  'assets/images/ruang tahanan dipenogoro.jpg',
                ),
                const SizedBox(height: 24),
                _buildAttractionCard(
                  context,
                  '03',
                  'Arsitektur',
                  'Menara & Tembok Benteng',
                  'Terdapat empat menara sudut yang dulunya berfungsi sebagai pos pengamatan.',
                  'assets/images/menara.jpg',
                ),
                const SizedBox(height: 24),
                _buildAttractionCard(
                  context,
                  '04',
                  'Fasilitas',
                  'Taman Tengah Benteng',
                  'Area terbuka hijau di tengah benteng yang asri dan sering digunakan untuk berbagai acara maupun festival budaya.',
                  'assets/images/Taman tengah.jpg',
                ),
                const SizedBox(height: 24),
                _buildAttractionCard(
                  context,
                  '05',
                  'Arsitektur',
                  'Bastion Mandarsyah',
                  'Salah satu sudut pertahanan utama di bagian utara benteng yang dulunya menjadi titik penting observasi maritim.',
                  'assets/images/bastion.jpg',
                ),
                const SizedBox(height: 24),
                _buildAttractionCard(
                  context,
                  '06',
                  'Gedung Peninggalan',
                  'Gereja Tua (Kerk)',
                  'Bangunan gereja peninggalan Belanda yang masih berdiri kokoh dan menjadi salah satu struktur arsitektur kolonial terbaik di dalam kompleks.',
                  'assets/images/gereja.jpg',
                ),
                const SizedBox(height: 24),
                _buildAttractionCard(
                  context,
                  '07',
                  'Situs Budaya',
                  'Pusat Kesenian',
                  'Area pementasan seni yang menjadi saksi berbagai pertunjukan tari, teater, dan musik tradisional khas Sulawesi Selatan.',
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ab/Fort_Rotterdam_by_Yogi_Sastaman.jpg/640px-Fort_Rotterdam_by_Yogi_Sastaman.jpg',
                ),
                const SizedBox(height: 24),
                _buildAttractionCard(
                  context,
                  '08',
                  'Area Edukasi',
                  'Perpustakaan Sejarah',
                  'Tempat yang menyimpan naskah-naskah lontara, literatur, serta dokumen berharga mengenai perjalanan panjang Fort Rotterdam.',
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b2/Fort_Rotterdam_museum.jpg/640px-Fort_Rotterdam_museum.jpg',
                ),
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
            'EKSPLORASI BENTENG',
            style: GoogleFonts.playfairDisplay(
              color: AppColors.gold,
              fontSize: 42,
              height: 1.1,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Temukan keunikan sejarah di setiap sudutnya',
            style: GoogleFonts.crimsonPro(
              color: AppColors.cream,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAttractionCard(BuildContext context, String num, String type, String title, String desc, String img) {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      margin: EdgeInsets.zero,
      child: InkWell(
        onTap: () => _showDetailDialog(context, num, type, title, img),
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                child: Stack(
                  children: [
                    img.startsWith('assets/')
                        ? Image.asset(
                            img,
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (ctx, err, st) => _buildPlaceholder(num, title),
                          )
                        : Image.network(
                            img,
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (ctx, err, st) => _buildPlaceholder(num, title),
                          ),
                    Positioned(
                      top: 16,
                      left: 16,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: AppColors.dark.withOpacity(0.85),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: AppColors.gold.withOpacity(0.4)),
                        ),
                        child: Text(
                          '#$num',
                          style: GoogleFonts.spaceMono(
                            color: AppColors.gold,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppColors.terracotta.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        type.toUpperCase(),
                        style: GoogleFonts.spaceMono(
                          color: AppColors.terracotta,
                          fontSize: 10,
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      title,
                      style: GoogleFonts.playfairDisplay(
                        color: AppColors.dark,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      desc,
                      style: GoogleFonts.crimsonPro(
                        color: AppColors.stone,
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Text(
                          'LIHAT DETAIL',
                          style: GoogleFonts.spaceMono(
                            color: AppColors.terracotta,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.arrow_forward, color: AppColors.terracotta, size: 16),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showDetailDialog(BuildContext context, String num, String type, String title, String img) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final detailText = AppDictionary.tr(context, 'att_${num}_detail');
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 600),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Stack(
                      children: [
                        img.startsWith('assets/')
                            ? Image.asset(
                                img,
                                height: 250,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                errorBuilder: (ctx, err, st) => _buildPlaceholder(num, title),
                              )
                            : Image.network(
                                img,
                                height: 250,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                errorBuilder: (ctx, err, st) => _buildPlaceholder(num, title),
                              ),
                        Positioned(
                          top: 16,
                          right: 16,
                          child: InkWell(
                            onTap: () => Navigator.of(context).pop(),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                            decoration: BoxDecoration(
                              color: AppColors.terracotta.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              type.toUpperCase(),
                              style: GoogleFonts.spaceMono(
                                color: AppColors.terracotta,
                                fontSize: 10,
                                letterSpacing: 1.5,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            title,
                            style: GoogleFonts.playfairDisplay(
                              color: AppColors.dark,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            detailText,
                            style: GoogleFonts.crimsonPro(
                              color: AppColors.stone,
                              fontSize: 18,
                              height: 1.6,
                            ),
                          ),
                          const SizedBox(height: 24),
                          Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              onPressed: () => Navigator.of(context).pop(),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.terracotta,
                                foregroundColor: AppColors.white,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero,
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                              ),
                              child: Text(
                                AppDictionary.tr(context, 'att_close_btn'),
                                style: GoogleFonts.spaceMono(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildPlaceholder(String num, String title) {
    IconData placeholderIcon;
    switch (num) {
      case '01': placeholderIcon = Icons.museum_outlined; break;
      case '02': placeholderIcon = Icons.vpn_key_outlined; break; // Prison cell / key
      case '03': placeholderIcon = Icons.castle_outlined; break; // Towers/Walls
      case '04': placeholderIcon = Icons.park_outlined; break; // Garden
      case '05': placeholderIcon = Icons.shield_outlined; break; // Bastion
      case '06': placeholderIcon = Icons.church_outlined; break; // Church
      case '07': placeholderIcon = Icons.music_note_outlined; break; // Art center
      case '08': placeholderIcon = Icons.local_library_outlined; break; // Library
      default: placeholderIcon = Icons.image_outlined;
    }
    return Container(
      height: 200,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.darkMid,
            AppColors.terracotta.withOpacity(0.85),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              placeholderIcon,
              color: AppColors.gold,
              size: 48,
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                title.toUpperCase(),
                style: GoogleFonts.spaceMono(
                  color: AppColors.cream.withOpacity(0.7),
                  fontSize: 10,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
