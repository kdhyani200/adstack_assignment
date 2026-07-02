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

/// Medium-screen (700-1100px) layout — sidebar collapses into a drawer,
/// main content and right panel remain side by side.
class TabletDashboard extends StatelessWidget {
  const TabletDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        backgroundColor: AppColors.cardBg,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
      ),
      drawer: const Drawer(child: SidedBar()),
      backgroundColor: AppColors.scaffoldBg,
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const Expanded(flex: 4, child: BannerCard()),

                          const SizedBox(height: 10),

                          Expanded(
                            flex: 3,
                            child: Row(
                              children: const [
                                Expanded(child: AllProjectsCard()),
                                SizedBox(width: 10),
                                Expanded(child: TopCreatorsCard()),
                              ],
                            ),
                          ),

                          const SizedBox(height: 10),

                          const Expanded(flex: 3, child: ChartCard()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(width: 4),

            SizedBox(
              width: 300,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const Expanded(flex: 5, child: CalenderCard()),
                    const SizedBox(height: 10),
                    const Expanded(flex: 2, child: BirthdayCard()),
                    const SizedBox(height: 10),
                    const Expanded(flex: 2, child: AnniversaryCard()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
