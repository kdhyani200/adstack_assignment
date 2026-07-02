import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/colors.dart';
import '../../widgets/anniversary_card.dart';
import '../../widgets/banner_card.dart';
import '../../widgets/birthday_card.dart';
import '../../widgets/calendar_card.dart';
import '../../widgets/creator_card.dart';
import '../../widgets/performance_chart.dart';
import '../../widgets/project_card.dart';
import '../../widgets/sidebar.dart';

/// Small-screen (<700px) layout — everything stacked in a scrollable
/// column, sidebar tucked away in a drawer.
class MobileDashboard extends StatelessWidget {
  const MobileDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(child: SidedBar()),

      appBar: AppBar(
        title: Text(
          "Dashboard",
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        backgroundColor: AppColors.cardBg,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              radius: 16,
              backgroundColor: AppColors.primaryLight,
              child: Icon(Icons.person, color: AppColors.primary, size: 18),
            ),
          ),
        ],
      ),

      backgroundColor: AppColors.scaffoldBg,

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          SizedBox(height: 220, child: BannerCard()),

          SizedBox(height: 16),

          SizedBox(height: 260, child: AllProjectsCard()),

          SizedBox(height: 16),

          SizedBox(height: 260, child: TopCreatorsCard()),

          SizedBox(height: 16),

          SizedBox(height: 260, child: ChartCard()),

          SizedBox(height: 16),

          SizedBox(height: 340, child: CalenderCard()),

          SizedBox(height: 16),

          SizedBox(height: 170, child: BirthdayCard()),

          SizedBox(height: 16),

          SizedBox(height: 170, child: AnniversaryCard()),
        ],
      ),
    );
  }
}
