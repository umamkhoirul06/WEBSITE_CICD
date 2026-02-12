import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/theme/app_spacing.dart';

/// Bookings Page - User's Course Bookings
class BookingsPage extends StatelessWidget {
  const BookingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Booking Saya'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Aktif'),
              Tab(text: 'Selesai'),
              Tab(text: 'Dibatalkan'),
            ],
            labelColor: AppColors.primary,
            unselectedLabelColor: AppColors.neutral500,
            indicatorColor: AppColors.primary,
          ),
        ),
        body: TabBarView(
          children: [
            // Active Bookings
            _BookingList(status: 'active'),
            // Completed Bookings
            _BookingList(status: 'completed'),
            // Cancelled Bookings
            _EmptyState(
              icon: Icons.cancel_outlined,
              title: 'Tidak ada booking dibatalkan',
              subtitle: 'Semua booking Anda berjalan dengan baik',
            ),
          ],
        ),
      ),
    );
  }
}

class _BookingList extends StatelessWidget {
  final String status;

  const _BookingList({required this.status});

  @override
  Widget build(BuildContext context) {
    final isActive = status == 'active';
    return ListView.builder(
      padding: const EdgeInsets.all(AppSpacing.lg),
      itemCount: isActive ? 2 : 3,
      itemBuilder: (context, index) => _BookingCard(
        isActive: isActive,
        index: index,
      ),
    );
  }
}

class _BookingCard extends StatelessWidget {
  final bool isActive;
  final int index;

  const _BookingCard({required this.isActive, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        border: Border.all(color: AppColors.neutral200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'SKL-2024-0012${index + 1}',
                style: AppTypography.labelMedium.copyWith(
                  color: AppColors.neutral500,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.sm,
                  vertical: AppSpacing.xs,
                ),
                decoration: BoxDecoration(
                  color: isActive
                      ? AppColors.accent.withOpacity(0.1)
                      : AppColors.neutral200,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                ),
                child: Text(
                  isActive ? 'Aktif' : 'Selesai',
                  style: AppTypography.labelSmall.copyWith(
                    color: isActive ? AppColors.accent : AppColors.neutral600,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),

          // Course Info
          Text(
            index == 0 ? 'Welding SMAW 3G' : 'Tata Boga Dasar',
            style: AppTypography.titleMedium,
          ),
          Text(
            index == 0 ? 'LPK Maju Jaya Indramayu' : 'LPK Prima',
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.neutral500,
            ),
          ),
          const SizedBox(height: AppSpacing.md),

          // Schedule
          Row(
            children: [
              const Icon(Icons.calendar_today, size: 16, color: AppColors.neutral400),
              const SizedBox(width: AppSpacing.sm),
              Text(
                '01 Mar - 01 Jun 2024',
                style: AppTypography.bodySmall,
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xs),
          Row(
            children: [
              const Icon(Icons.access_time, size: 16, color: AppColors.neutral400),
              const SizedBox(width: AppSpacing.sm),
              Text(
                '13:00 - 17:00 WIB',
                style: AppTypography.bodySmall,
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),

          // Action Button
          if (isActive)
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.qr_code_2),
                label: const Text('Lihat E-Ticket'),
              ),
            ),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _EmptyState({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xxxl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 64, color: AppColors.neutral300),
            const SizedBox(height: AppSpacing.lg),
            Text(
              title,
              style: AppTypography.titleMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              subtitle,
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.neutral500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
