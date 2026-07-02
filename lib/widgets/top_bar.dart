import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/colors.dart';

class TopBar extends StatelessWidget {
  final VoidCallback? onMenuTap;
  final bool showMenuButton;

  const TopBar({super.key, this.onMenuTap, this.showMenuButton = false});

  @override
  Widget build(BuildContext context) {
    final isNarrow = MediaQuery.of(context).size.width < 900;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          if (showMenuButton)
            IconButton(
              onPressed: onMenuTap,
              icon: const Icon(
                Icons.menu_rounded,
                color: AppColors.textPrimary,
              ),
            ),
          Text(
            "Home",
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(width: 24),
          if (!isNarrow)
            Expanded(
              child: Container(
                height: 44,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: AppColors.scaffoldBg,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        style: GoogleFonts.poppins(fontSize: 14),
                        decoration: InputDecoration(
                          hintText: "Search",
                          hintStyle: GoogleFonts.poppins(
                            color: AppColors.textSecondary,
                            fontSize: 14,
                          ),
                          border: InputBorder.none,
                          isDense: true,
                        ),
                      ),
                    ),
                    const Icon(Icons.search, color: AppColors.textSecondary),
                  ],
                ),
              ),
            )
          else
            const Spacer(),
          const SizedBox(width: 16),
          _iconButton(Icons.mail_outline_rounded),
          const SizedBox(width: 10),
          _iconButton(Icons.notifications_none_rounded),
          const SizedBox(width: 10),
          _iconButton(Icons.power_settings_new_rounded),
          const SizedBox(width: 14),
          const CircleAvatar(
            radius: 20,
            backgroundColor: AppColors.primaryLight,
            child: Icon(Icons.person, color: AppColors.primary),
          ),
        ],
      ),
    );
  }

  Widget _iconButton(IconData icon) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: AppColors.scaffoldBg,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon, color: AppColors.textSecondary, size: 20),
    );
  }
}
