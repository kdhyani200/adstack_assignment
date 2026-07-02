import 'package:adstack_assignment/screens/dashboard/tablet_dashboard.dart';
import 'package:flutter/material.dart';

import '../../core/responsive.dart';
import 'desktop_dashboard.dart';
import 'mobile_dashboard.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (Responsive.isDesktop(context)) {
      return const DesktopDashboard();
    }

    if (Responsive.isTablet(context)) {
      return const TabletDashboard();
    }

    return const MobileDashboard();
  }
}
