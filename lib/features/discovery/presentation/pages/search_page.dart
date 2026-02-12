import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/theme/app_spacing.dart';

/// Search Page - Course Discovery with Filters
class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _searchController = TextEditingController();
  String _selectedKecamatan = 'Semua';

  final List<String> _kecamatanList = [
    'Semua',
    'Jatibarang',
    'Haurgeulis',
    'Balongan',
    'Lohbener',
    'Sindang',
    'Indramayu',
    'Karangampel',
    'Kandanghaur',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cari Kursus'),
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Cari kursus atau LPK...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.tune),
                  onPressed: () {
                    // Show filter bottom sheet
                  },
                ),
              ),
            ),
          ),

          // Kecamatan Filter Chips
          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              itemCount: _kecamatanList.length,
              itemBuilder: (context, index) {
                final kec = _kecamatanList[index];
                final isSelected = _selectedKecamatan == kec;
                return Padding(
                  padding: const EdgeInsets.only(right: AppSpacing.sm),
                  child: FilterChip(
                    label: Text(kec),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() => _selectedKecamatan = kec);
                    },
                    selectedColor: AppColors.primary.withOpacity(0.2),
                    checkmarkColor: AppColors.primary,
                    labelStyle: TextStyle(
                      color: isSelected ? AppColors.primary : AppColors.neutral600,
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          // Results Count
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
            child: Row(
              children: [
                Text(
                  'Menampilkan 24 hasil',
                  style: AppTypography.bodyMedium.copyWith(
                    color: AppColors.neutral500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.md),

          // Results List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              itemCount: 10,
              itemBuilder: (context, index) => _SearchResultCard(index: index),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}

class _SearchResultCard extends StatelessWidget {
  final int index;

  const _SearchResultCard({required this.index});

  @override
  Widget build(BuildContext context) {
    final courses = [
      ('Welding SMAW 3G', 'LPK Maju Jaya', 'Jatibarang', 2500000, 4.9, '15 Feb 2024'),
      ('Welding SMAW 4G', 'LPK Berkah', 'Haurgeulis', 3000000, 4.8, '01 Mar 2024'),
      ('Tata Boga Dasar', 'LPK Prima', 'Balongan', 1800000, 4.7, '20 Feb 2024'),
    ];
    final course = courses[index % courses.length];

    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        border: Border.all(color: AppColors.neutral200),
      ),
      child: Row(
        children: [
          // Image Placeholder
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: AppColors.neutral200,
              borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
            ),
            child: const Icon(Icons.image, color: AppColors.neutral400),
          ),
          const SizedBox(width: AppSpacing.md),

          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(course.$1, style: AppTypography.titleSmall),
                Text(
                  course.$2,
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.neutral500,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Row(
                  children: [
                    const Icon(Icons.star, size: 14, color: AppColors.secondary),
                    const SizedBox(width: 2),
                    Text(course.$5.toString(), style: AppTypography.labelSmall),
                    const SizedBox(width: AppSpacing.sm),
                    Text(
                      '• Rp ${(course.$4 / 1000000).toStringAsFixed(1)}jt',
                      style: AppTypography.labelSmall.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.xs),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 12, color: AppColors.neutral400),
                    Text(
                      ' ${(index + 1) * 1.2}km • ${course.$3}',
                      style: AppTypography.labelSmall.copyWith(
                        color: AppColors.neutral500,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.calendar_today, size: 12, color: AppColors.neutral400),
                    Text(
                      ' Mulai: ${course.$6}',
                      style: AppTypography.labelSmall.copyWith(
                        color: AppColors.neutral500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
