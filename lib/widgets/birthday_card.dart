import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/colors.dart';
import '../data/mock_data.dart';

/// "Today Birthday" card — dark panel with avatar stack + CTA.
class BirthdayCard extends StatelessWidget {
  const BirthdayCard({super.key});

  @override
  Widget build(BuildContext context) {
    final people = MockData.birthdays;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.panelDark,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Text("✨", style: TextStyle(fontSize: 14)),
              const SizedBox(width: 6),
              Text(
                "Today Birthday",
                style: GoogleFonts.poppins(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textOnDark,
                ),
              ),
              const Spacer(),
              const Text("✨", style: TextStyle(fontSize: 14)),
            ],
          ),
          Row(
            children: [
              ...people.map(
                (p) => Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: AppColors.panelDarkAlt,
                    child: Text(p.emoji, style: const TextStyle(fontSize: 14)),
                  ),
                ),
              ),
              const Spacer(),
              Text(
                "Total",
                style: GoogleFonts.poppins(
                  fontSize: 10,
                  color: AppColors.textOnDarkMuted,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                "${people.length}",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textOnDark,
                ),
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              icon: const Icon(Icons.card_giftcard, size: 15),
              label: Text(
                "Birthday Wishing",
                style: GoogleFonts.poppins(
                  fontSize: 11.5,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
