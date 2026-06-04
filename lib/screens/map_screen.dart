import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/footer.dart';
import '../l10n/app_dictionary.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 100.0, bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTitleSection(context),
                const SizedBox(height: 32),
                _buildInteractiveMap(context),
                const SizedBox(height: 40),
                _buildLegendSection(context),
                const SizedBox(height: 40),
              ],
            ),
          ),
          const AppFooter(),
        ],
      ),
    );
  }

  Widget _buildTitleSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppDictionary.tr(context, 'map_header'),
          style: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(color: AppColors.dark),
        ),
        const SizedBox(height: 8),
        Text(
          AppDictionary.tr(context, 'map_desc'),
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: AppColors.stone),
        ),
      ],
    );
  }

  Widget _buildInteractiveMap(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.creamDark,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.stoneLight),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: AspectRatio(
        aspectRatio: 4 / 3,
        child: Stack(
          children: [
            // Background image
            Positioned.fill(
              child: Opacity(
                opacity: 0.9,
                child: Image.network(
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuBsgyoYi365oOrXW_qRtKabms0csaR2p4CPz-ICefSFGX2fTK_QHBZyqD6F6E2aVRzd3VYilSJa629nfIrl9YEWbSe1HLWhB8Zv2cfRtNViDEWRkNozSFy8MXOreRYVh9UBfY2QN87jOXoT2zzdHlFD1qF1AB4Q9n-dU_Gzp43Bo4E7mjkegwCsrfYB8B6U831K5ygq3blwgfxIe3sNVDcpsaXEdBSFiOyzcXzZM1yDJMuWTmy34eX_0Pprk-LV_CMUfPliPW0owVw',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Pin 1
            Align(
              alignment: const FractionalOffset(0.30, 0.25),
              child: _buildPin(
                context, 
                '1', 
                '${AppDictionary.tr(context, 'map_b_buton_title')}\n\n${AppDictionary.tr(context, 'map_b_buton_desc')}'
              ),
            ),
            // Pin 2
            Align(
              alignment: const FractionalOffset(0.60, 0.45),
              child: _buildPin(
                context, 
                '2', 
                '${AppDictionary.tr(context, 'map_b_bone_title')}\n\n${AppDictionary.tr(context, 'map_b_bone_desc')}'
              ),
            ),
            // Pin 3
            Align(
              alignment: const FractionalOffset(0.20, 0.70),
              child: _buildPin(
                context, 
                '3', 
                '${AppDictionary.tr(context, 'map_b_bacan_title')}\n\n${AppDictionary.tr(context, 'map_b_bacan_desc')}'
              ),
            ),
            // Pin 4
            Align(
              alignment: const FractionalOffset(0.75, 0.15),
              child: _buildPin(
                context, 
                '4', 
                '${AppDictionary.tr(context, 'map_b_mandarsyah_title')}\n\n${AppDictionary.tr(context, 'map_b_mandarsyah_desc')}'
              ),
            ),
            // Interaction Overlay Controls
            Positioned(
              bottom: 16,
              right: 16,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildMapControlButton(Icons.zoom_in),
                  const SizedBox(height: 8),
                  _buildMapControlButton(Icons.zoom_out),
                  const SizedBox(height: 8),
                  _buildMapControlButton(Icons.near_me),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPin(BuildContext context, String number, String tooltipText) {
    return Tooltip(
      message: tooltipText,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: 24),
      textStyle: const TextStyle(color: AppColors.white, height: 1.4, fontSize: 14),
      decoration: BoxDecoration(
        color: AppColors.dark.withOpacity(0.9),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: AppColors.terracotta,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Text(
            number,
            style: Theme.of(
              context,
            ).textTheme.titleSmall?.copyWith(color: AppColors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildMapControlButton(IconData icon) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.cream,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.stoneLight),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Icon(icon, color: AppColors.terracotta, size: 24),
    );
  }

  Widget _buildLegendSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppDictionary.tr(context, 'map_legend_title'),
              style: Theme.of(
                context,
              ).textTheme.titleSmall?.copyWith(color: AppColors.dark),
            ),
            Text(
              AppDictionary.tr(context, 'map_total_bastions'),
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: AppColors.stone,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        _buildLegendItem(
          context,
          number: '1',
          title: AppDictionary.tr(context, 'map_b_buton_title'),
          description: AppDictionary.tr(context, 'map_b_buton_desc'),
        ),
        const SizedBox(height: 16),
        _buildLegendItem(
          context,
          number: '2',
          title: AppDictionary.tr(context, 'map_b_bone_title'),
          description: AppDictionary.tr(context, 'map_b_bone_desc'),
        ),
        const SizedBox(height: 16),
        _buildLegendItem(
          context,
          number: '3',
          title: AppDictionary.tr(context, 'map_b_bacan_title'),
          description: AppDictionary.tr(context, 'map_b_bacan_desc'),
        ),
        const SizedBox(height: 16),
        _buildLegendItem(
          context,
          number: '4',
          title: AppDictionary.tr(context, 'map_b_mandarsyah_title'),
          description: AppDictionary.tr(context, 'map_b_mandarsyah_desc'),
        ),
      ],
    );
  }

  Widget _buildLegendItem(
    BuildContext context, {
    required String number,
    required String title,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.stoneLight),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: const BoxDecoration(
              color: AppColors.terracotta,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                number,
                style: const TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(color: AppColors.terracotta),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.stone,
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
