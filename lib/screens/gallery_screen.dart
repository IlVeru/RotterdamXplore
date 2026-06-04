import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../widgets/footer.dart';

class GalleryItem {
  final String id;
  final String imageUrl;
  final String title;
  final String category;

  GalleryItem({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.category,
  });
}

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  String _selectedCategory = 'Semua';
  final List<String> _categories = ['Semua', 'Arsitektur', 'Museum', 'Taman', 'Event'];

  final List<GalleryItem> _dummyItems = [
    GalleryItem(
      id: '1',
      imageUrl: 'assets/images/benteng peninggalan.jpg',
      title: 'Benteng Peninggalan',
      category: 'Arsitektur',
    ),
    GalleryItem(
      id: '2',
      imageUrl: 'assets/images/tembok.jpg',
      title: 'Tembok Kuno',
      category: 'Arsitektur',
    ),
    GalleryItem(
      id: '3',
      imageUrl: 'assets/images/museum.jpg',
      title: 'Koleksi La Galigo',
      category: 'Museum',
    ),
    GalleryItem(
      id: '4',
      imageUrl: 'assets/images/pameran budaya.jpg',
      title: 'Pameran Budaya',
      category: 'Event',
    ),
    GalleryItem(
      id: '5',
      imageUrl: 'assets/images/Taman tengah.jpg',
      title: 'Taman Tengah',
      category: 'Taman',
    ),
    GalleryItem(
      id: '6',
      imageUrl: 'assets/images/malam kesenian.jpg',
      title: 'Malam Kesenian',
      category: 'Event',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final filteredItems = _selectedCategory == 'Semua' 
        ? _dummyItems 
        : _dummyItems.where((item) => item.category == _selectedCategory).toList();

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildHeroSection(context),
          Container(
            color: AppColors.dark,
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildCategoryFilter(),
                const SizedBox(height: 24),
                _buildGalleryGrid(filteredItems),
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
              'https://images.unsplash.com/photo-1533423719013-1b9134a4c281?q=80&w=1280&auto=format&fit=crop'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            AppColors.dark.withValues(alpha: 0.8),
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
            'GALERI FOTO',
            style: GoogleFonts.playfairDisplay(
              color: AppColors.gold,
              fontSize: 42,
              height: 1.1,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Potret Keindahan Fort Rotterdam',
            style: GoogleFonts.crimsonPro(
              color: AppColors.cream,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryFilter() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: _categories.map((category) {
          final isSelected = _selectedCategory == category;
          return Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: InkWell(
              onTap: () {
                setState(() {
                  _selectedCategory = category;
                });
              },
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.gold : Colors.transparent,
                  border: Border.all(
                    color: isSelected ? AppColors.gold : AppColors.gold.withValues(alpha: 0.3),
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  category.toUpperCase(),
                  style: GoogleFonts.spaceMono(
                    color: isSelected ? AppColors.dark : AppColors.cream,
                    fontSize: 12,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildGalleryGrid(List<GalleryItem> items) {
    if (items.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Text(
            'Tidak ada foto untuk kategori ini.',
            style: GoogleFonts.spaceMono(color: AppColors.cream.withValues(alpha: 0.6)),
          ),
        ),
      );
    }

    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.8,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return _buildGalleryCard(item);
      },
    );
  }

  Widget _buildGalleryCard(GalleryItem item) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.gold.withValues(alpha: 0.3)),
      ),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          item.imageUrl.startsWith('assets/')
              ? Image.asset(
                  item.imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: AppColors.darkMid,
                      child: const Center(
                        child: Icon(Icons.broken_image, color: AppColors.stone, size: 48),
                      ),
                    );
                  },
                )
              : Image.network(
                  item.imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: AppColors.darkMid,
                      child: const Center(
                        child: Icon(Icons.broken_image, color: AppColors.stone, size: 48),
                      ),
                    );
                  },
                ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  AppColors.dark.withValues(alpha: 0.95),
                  AppColors.dark.withValues(alpha: 0.6),
                  Colors.transparent,
                ],
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.category.toUpperCase(),
                  style: GoogleFonts.spaceMono(
                    color: AppColors.gold,
                    fontSize: 12,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  item.title,
                  style: GoogleFonts.playfairDisplay(
                    color: AppColors.cream,
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
