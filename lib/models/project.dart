class ProjectItem {
  final String title;
  final String subtitle;
  final bool highlighted;

  const ProjectItem({
    required this.title,
    required this.subtitle,
    this.highlighted = false,
  });
}
