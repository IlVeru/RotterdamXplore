import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'theme/app_theme.dart';
import 'theme/app_colors.dart';

import 'screens/home_screen.dart';
import 'screens/history_screen.dart';
import 'screens/visitor_screen.dart';
import 'screens/attractions_screen.dart';
import 'screens/facilities_screen.dart';
import 'screens/gallery_screen.dart';
import 'screens/contact_screen.dart';
import 'screens/map_screen.dart';
import 'screens/quiz_screen.dart';

import 'package:provider/provider.dart';
import 'providers/locale_provider.dart';
import 'l10n/app_dictionary.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => LocaleProvider(),
      child: const RotterdamXploreApp(),
    ),
  );
}

class RotterdamXploreApp extends StatelessWidget {
  const RotterdamXploreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RotterdamXplore',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  bool _scrollToBooking = false;

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return HomeScreen(onNavigate: _onNavigate);
      case 1:
        return const HistoryScreen();
      case 2:
        return const VisitorScreen();
      case 3:
        return const AttractionsScreen();
      case 4:
        return const FacilitiesScreen();
      case 5:
        return const GalleryScreen();
      case 6:
        // Consume the flag: pass it once then reset
        final scroll = _scrollToBooking;
        if (_scrollToBooking) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            setState(() => _scrollToBooking = false);
          });
        }
        return ContactScreen(scrollToBooking: scroll);
      case 7:
        return const MapScreen();
      case 8:
        return const QuizScreen();
      default:
        return HomeScreen(onNavigate: _onNavigate);
    }
  }

  // Helper method to get localized title based on index
  String _getLocalizedTitle(BuildContext context, int index) {
    switch (index) {
      case 0: return AppDictionary.tr(context, 'home');
      case 1: return AppDictionary.tr(context, 'history');
      case 2: return AppDictionary.tr(context, 'visitor_info');
      case 3: return AppDictionary.tr(context, 'explore');
      case 4: return AppDictionary.tr(context, 'facilities');
      case 5: return AppDictionary.tr(context, 'gallery');
      case 6: return AppDictionary.tr(context, 'contact');
      case 7: return AppDictionary.tr(context, 'map');
      case 8: return AppDictionary.tr(context, 'quiz');
      default: return '';
    }
  }

  void _onNavigate(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onDrawerMenuTapped(int index) {
    _onNavigate(index);
    Navigator.of(context).pop(); // Close drawer
  }

  int _getBottomNavIndex(int pageIndex) {
    switch (pageIndex) {
      case 0: return 0; // Home
      case 7: return 1; // Map
      case 1: return 2; // History
      case 5: return 3; // Gallery
      case 3: return 4; // Explore
      default: return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, 
      appBar: AppBar(
        backgroundColor: AppColors.dark.withOpacity(0.92),
        elevation: 0,
        centerTitle: true,
        title: RichText(
          text: TextSpan(
            style: GoogleFonts.playfairDisplay(
              fontSize: 22,
              fontWeight: FontWeight.w900,
              color: AppColors.cream,
            ),
            children: const [
              TextSpan(text: 'Rotterdam'),
              TextSpan(
                text: 'Xplore',
                style: TextStyle(color: AppColors.gold),
              ),
            ],
          ),
        ),
        actions: [
          // Language Toggle
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: Text(
                Provider.of<LocaleProvider>(context).isEnglish ? 'EN' : 'ID',
                style: GoogleFonts.spaceMono(
                  color: AppColors.gold,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              onPressed: () {
                Provider.of<LocaleProvider>(context, listen: false).toggleLocale();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(
              child: InkWell(
                onTap: () {
                  setState(() {
                    _scrollToBooking = true;
                    _selectedIndex = 6; // Go to Contact / Pesan Tiket
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  color: AppColors.terracotta,
                  child: Text(
                    AppDictionary.tr(context, 'book_ticket'),
                    style: GoogleFonts.spaceMono(
                      color: AppColors.white,
                      fontSize: 10,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      drawer: Drawer(
        backgroundColor: AppColors.dark,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: AppColors.darkMid,
                border: Border(bottom: BorderSide(color: AppColors.gold, width: 2)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    AppDictionary.tr(context, 'menu_title'),
                    style: const TextStyle(color: AppColors.cream, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    AppDictionary.tr(context, 'menu_subtitle'),
                    style: GoogleFonts.crimsonPro(color: AppColors.stone, fontSize: 14),
                  ),
                ],
              ),
            ),
            _buildDrawerItem(context, 0, 'home'),
            _buildDrawerItem(context, 1, 'history'),
            _buildDrawerItem(context, 2, 'visitor_info'),
            _buildDrawerItem(context, 3, 'explore'),
            _buildDrawerItem(context, 4, 'facilities'),
            _buildDrawerItem(context, 5, 'gallery'),
            _buildDrawerItem(context, 6, 'contact'),
            const Divider(color: AppColors.stone),
            _buildDrawerItem(context, 7, 'map'),
            _buildDrawerItem(context, 8, 'quiz'),
          ],
        ),
      ),
      body: _getPage(_selectedIndex),
      // Bottom navigation bar dipertahankan untuk fitur utama agar cepat diakses
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: AppColors.gold.withOpacity(0.2), width: 1),
          ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.dark.withOpacity(0.95),
          selectedItemColor: AppColors.gold,
          unselectedItemColor: AppColors.cream.withOpacity(0.5),
          selectedLabelStyle: GoogleFonts.spaceMono(
            fontSize: 10,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.2,
          ),
          unselectedLabelStyle: GoogleFonts.spaceMono(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            letterSpacing: 1.0,
          ),
          currentIndex: _getBottomNavIndex(_selectedIndex),
          onTap: (index) {
            // Map index to our actual pages if tapped from bottom nav
            // 0: Home, 1: Peta(7), 2: History(1), 3: Gallery(5), 4: Eksplorasi(3)
            setState(() {
              if (index == 0) _selectedIndex = 0;
              if (index == 1) _selectedIndex = 7;
              if (index == 2) _selectedIndex = 1;
              if (index == 3) _selectedIndex = 5;
              if (index == 4) _selectedIndex = 3;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'HOME'),
            BottomNavigationBarItem(icon: Icon(Icons.map_outlined), label: 'MAP'),
            BottomNavigationBarItem(icon: Icon(Icons.history_edu), label: 'HISTORY'),
            BottomNavigationBarItem(icon: Icon(Icons.photo_library_outlined), label: 'GALLERY'),
            BottomNavigationBarItem(icon: Icon(Icons.explore_outlined), label: 'EXPLORE'),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, int index, String dictKey) {
    final isSelected = _selectedIndex == index;
    return ListTile(
      title: Text(
        AppDictionary.tr(context, dictKey).toUpperCase(),
        style: GoogleFonts.spaceMono(
          color: isSelected ? AppColors.gold : AppColors.cream.withOpacity(0.7),
          fontSize: 14,
          letterSpacing: 1.5,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      onTap: () => _onDrawerMenuTapped(index),
    );
  }
}
