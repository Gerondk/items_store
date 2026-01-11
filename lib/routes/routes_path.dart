enum RoutePath {
  login('/login'),
  itemDetail('/itemDetail'),
  items('/items'),
  bookmarkedItems('/bookmarkedItems');

  final String path;
  const RoutePath(this.path);
}
