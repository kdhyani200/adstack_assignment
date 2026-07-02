class CreatorItem {
  final String handle;
  final int artworks;
  final double rating; // 0.0 - 1.0, used to size the rating bar

  const CreatorItem({
    required this.handle,
    required this.artworks,
    required this.rating,
  });
}
