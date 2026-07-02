# Adstacks Media — Office Dashboard (Flutter)

A responsive Flutter dashboard built for the Adstacks Media "Flutter Developer
App & Web" assignment. It reproduces the shared design (home dashboard with
projects, top creators, performance chart, calendar, birthdays and
anniversaries) and adapts across **mobile**, **tablet**, and **web/desktop**
using distinct layouts per breakpoint.

## Project structure

```
lib/
  core/
    colors.dart        # Central color palette
    constants.dart      # Spacing / radius / breakpoint constants
    responsive.dart      # Mobile / tablet / desktop breakpoint helpers
  data/
    mock_data.dart       # Mock data powering the dashboard widgets
  models/                 # Simple data models (Project, Creator, Person)
  screens/dashboard/
    dashboard_screen.dart  # Picks layout based on screen width
    desktop_dashboard.dart # >=1100px — sidebar + content + right panel
    tablet_dashboard.dart  # 700-1100px — drawer + content + right panel
    mobile_dashboard.dart  # <700px — drawer + stacked scroll view
  widgets/                # Reusable UI pieces (banner, cards, chart, sidebar...)
```

## Responsiveness

Breakpoints (see `lib/core/responsive.dart`):

- **Mobile:** width < 700 — single scrollable column, sidebar in a drawer.
- **Tablet:** 700 ≤ width < 1100 — two-column layout, sidebar in a drawer.
- **Desktop/Web:** width ≥ 1100 — full 3-column layout with a persistent
  sidebar, matching the shared mockup.

## Getting started

```bash
flutter pub get
flutter run -d chrome      # run on web
flutter run                # run on a connected mobile device/emulator
```

## Building for release

```bash
flutter build web --release        # web
flutter build apk --release        # Android
flutter build ios --release        # iOS
```

## Deployment

### Vercel

This repo includes a `vercel.json` that bootstraps the Flutter SDK during
the Vercel build and outputs the compiled site from `build/web`. Just
import the repository into Vercel — no extra configuration required.

### Firebase Hosting

```bash
flutter build web --release
firebase login
firebase init hosting     # choose build/web as the public directory (already set in firebase.json)
firebase deploy
```

## Notes

- All dashboard content (projects, creators, birthdays, anniversary,
  chart data) is mock data in `lib/data/mock_data.dart` — swap in a real
  API/data source there.
- The performance chart is drawn with a custom `CustomPainter`
  (`lib/widgets/performance_chart.dart`) so no extra charting package is
  required.
