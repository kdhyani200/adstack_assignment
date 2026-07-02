import '../models/creator.dart';
import '../models/person.dart';
import '../models/project.dart';

class MockData {
  MockData._();

  static const List<ProjectItem> projects = [
    ProjectItem(
      title: "Technology behind the Blockchain",
      subtitle: "Project #1 • See project details",
      highlighted: true,
    ),
    ProjectItem(
      title: "Technology behind the Blockchain",
      subtitle: "Project #1 • See project details",
    ),
    ProjectItem(
      title: "Technology behind the Blockchain",
      subtitle: "Project #1 • See project details",
    ),
  ];

  static const List<CreatorItem> creators = [
    CreatorItem(handle: "@maddison_c21", artworks: 9821, rating: 0.9),
    CreatorItem(handle: "@karlwil902", artworks: 7032, rating: 0.7),
    CreatorItem(handle: "@maddison_c21", artworks: 9821, rating: 0.85),
    CreatorItem(handle: "@maddison_c21", artworks: 9821, rating: 0.6),
  ];

  static const List<PersonItem> birthdays = [
    PersonItem(name: "Riya", emoji: "🎂"),
    PersonItem(name: "Arjun", emoji: "🎉"),
  ];

  static const List<PersonItem> anniversaries = [
    PersonItem(name: "Neha", emoji: "🎊"),
    PersonItem(name: "Kabir", emoji: "🥂"),
    PersonItem(name: "Simran", emoji: "💐"),
  ];

  /// Performance chart data — two series across years.
  static const List<String> chartYears = [
    "2015",
    "2016",
    "2017",
    "2018",
    "2019",
    "2020",
  ];

  static const List<double> pendingSeries = [18, 30, 22, 40, 16, 34];
  static const List<double> doneSeries = [12, 20, 38, 18, 44, 24];

  static const List<String> sidebarWorkspaces = ["Adstacks", "Finance"];
}
