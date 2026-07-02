import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/colors.dart';

class CalenderCard extends StatelessWidget {
  const CalenderCard({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final firstWeekday = DateTime(now.year, now.month, 1).weekday;
    final daysInMonth = DateTime(now.year, now.month + 1, 0).day;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.panelDark,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "GENERAL 10:00 AM TO 7:00 PM",
            style: GoogleFonts.poppins(
              fontSize: 10.5,
              fontWeight: FontWeight.w600,
              color: AppColors.textOnDarkMuted,
              letterSpacing: 0.4,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [_pill(_monthName(now.month)), _pill("${now.year}")],
          ),
          const SizedBox(height: 12),
          Row(
            children: const ["Mo", "Tu", "We", "Th", "Fr", "Sa", "Su"]
                .map(
                  (d) => Expanded(
                    child: Center(
                      child: Text(
                        d,
                        style: TextStyle(
                          fontSize: 10,
                          color: AppColors.textOnDarkMuted,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 6),
          Expanded(
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
              ),
              itemCount: 42,
              itemBuilder: (context, index) {
                final dayNumber = index - (firstWeekday - 1) + 1;
                final isValid = dayNumber >= 1 && dayNumber <= daysInMonth;
                final isToday = isValid && dayNumber == now.day;
                if (!isValid) return const SizedBox.shrink();

                return Center(
                  child: Container(
                    height: 26,
                    width: 26,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isToday ? AppColors.primary : Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      "$dayNumber",
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        fontWeight: isToday ? FontWeight.w600 : FontWeight.w400,
                        color: isToday
                            ? Colors.white
                            : AppColors.textOnDarkMuted,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _pill(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.panelDarkAlt,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 11,
              color: AppColors.textOnDark,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 4),
          const Icon(
            Icons.keyboard_arrow_down,
            size: 14,
            color: AppColors.textOnDarkMuted,
          ),
        ],
      ),
    );
  }

  String _monthName(int month) {
    const names = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec",
    ];
    return names[month - 1];
  }
}
