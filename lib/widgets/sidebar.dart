import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/colors.dart';
import '../data/mock_data.dart';

class SidedBar extends StatefulWidget {
  const SidedBar({super.key});

  @override
  State<SidedBar> createState() => _SidedBarState();
}

class _SidedBarState extends State<SidedBar> {
  int _selectedIndex = 0;
  final Set<String> _expandedWorkspaces = {"Adstacks"};

  static const _menuItems = [
    _MenuData(Icons.home_rounded, "Home"),
    _MenuData(Icons.people_alt_outlined, "Employees"),
    _MenuData(Icons.event_available_outlined, "Attendance"),
    _MenuData(Icons.summarize_outlined, "Summary"),
    _MenuData(Icons.info_outline, "Information"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: AppColors.sidebarBg,
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/image.png", height: 34),
                  const SizedBox(width: 8),
                ],
              ),
            ),

            const SizedBox(height: 24),

            const CircleAvatar(
              radius: 32,
              backgroundColor: AppColors.primaryLight,
              child: Icon(Icons.person, color: AppColors.primary, size: 32),
            ),

            const SizedBox(height: 12),

            Text(
              "K.Dhyani",
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),

            const SizedBox(height: 6),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.primaryLight,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                "Admin",
                style: GoogleFonts.poppins(
                  color: AppColors.primary,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                children: [
                  for (int i = 0; i < _menuItems.length; i++)
                    _menuTile(
                      _menuItems[i].icon,
                      _menuItems[i].label,
                      selected: _selectedIndex == i,
                      onTap: () => {}, //setState(() => _selectedIndex = i),
                    ),

                  const SizedBox(height: 20),

                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Text(
                          "WORKSPACES",
                          style: GoogleFonts.poppins(
                            color: AppColors.textSecondary,
                            fontWeight: FontWeight.w600,
                            fontSize: 11,
                            letterSpacing: 0.4,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Icon(Icons.add, size: 16, color: AppColors.textSecondary),
                      const SizedBox(width: 12),
                    ],
                  ),

                  const SizedBox(height: 8),

                  for (final workspace in MockData.sidebarWorkspaces)
                    _workspaceTile(workspace),
                ],
              ),
            ),

            const Divider(height: 1, color: AppColors.divider),

            _menuTile(Icons.settings_outlined, "Setting", onTap: () {}),
            _menuTile(Icons.logout_outlined, "Logout", onTap: () {}),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _menuTile(
    IconData icon,
    String title, {
    bool selected = false,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3),
      decoration: BoxDecoration(
        color: selected ? AppColors.primaryLight : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        dense: true,
        leading: Icon(
          icon,
          color: selected ? AppColors.primary : AppColors.iconMuted,
          size: 20,
        ),
        title: Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 13.5,
            color: selected ? AppColors.primary : AppColors.textPrimary,
            fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
        onTap: onTap,
      ),
    );
  }

  Widget _workspaceTile(String name) {
    final expanded = _expandedWorkspaces.contains(name);
    return Column(
      children: [
        ListTile(
          dense: true,
          leading: const Icon(
            Icons.folder_outlined,
            size: 18,
            color: AppColors.iconMuted,
          ),
          title: Text(
            name,
            style: GoogleFonts.poppins(
              fontSize: 13.5,
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: Icon(
            expanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
            size: 18,
            color: AppColors.iconMuted,
          ),
          onTap: () {
            setState(() {
              if (expanded) {
                _expandedWorkspaces.remove(name);
              } else {
                _expandedWorkspaces.add(name);
              }
            });
          },
        ),
      ],
    );
  }
}

class _MenuData {
  final IconData icon;
  final String label;
  const _MenuData(this.icon, this.label);
}
