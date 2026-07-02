import 'package:flutter/material.dart';

import '../../core/colors.dart';
import '../../widgets/anniversary_card.dart';
import '../../widgets/banner_card.dart';
import '../../widgets/birthday_card.dart';
import '../../widgets/calendar_card.dart';
import '../../widgets/creator_card.dart';
import '../../widgets/performance_chart.dart';
import '../../widgets/project_card.dart';
import '../../widgets/sidebar.dart';
import '../../widgets/top_bar.dart';

/// Wide-screen (>=1100px) layout — sidebar + main content + right panel,
/// all visible at once, matching the office dashboard mockup.
class DesktopDashboard extends StatelessWidget {
  const DesktopDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      body: SafeArea(
        child: Row(
          children: [
            const SidedBar(),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    // Top bar spans across both columns
                    const SizedBox(height: 70, child: TopBar()),

                    const SizedBox(height: 12),

                    Expanded(
                      child: Row(
                        children: [
                          /// Main Content
                          Expanded(
                            flex: 3,
                            child: Column(
                              children: [
                                const Expanded(flex: 3, child: BannerCard()),

                                const SizedBox(height: 12),

                                Expanded(
                                  flex: 3,
                                  child: Row(
                                    children: const [
                                      Expanded(child: AllProjectsCard()),
                                      SizedBox(width: 12),
                                      Expanded(child: TopCreatorsCard()),
                                    ],
                                  ),
                                ),

                                const SizedBox(height: 12),

                                const Expanded(flex: 3, child: ChartCard()),
                              ],
                            ),
                          ),

                          const SizedBox(width: 12),

                          /// Right Panel
                          SizedBox(
                            width: 320,
                            child: Column(
                              children: const [
                                Expanded(flex: 5, child: CalenderCard()),

                                SizedBox(height: 12),

                                Expanded(flex: 2, child: BirthdayCard()),

                                SizedBox(height: 12),

                                Expanded(flex: 2, child: AnniversaryCard()),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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
