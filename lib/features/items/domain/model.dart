class ItemModel {
  final int id;
  final String title;
  final String description;
  final double price;
  final List<String> images;

  ItemModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.images,
  });
}
