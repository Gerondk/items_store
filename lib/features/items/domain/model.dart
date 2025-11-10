import 'package:intl/intl.dart';

import '../data/dto_product_entity.dart';

class ItemModel {
  final int id;
  final String title;
  final String description;
  final double price;
  final String creationAt;
  final String updatedAt;
  final DtoProductCategory category;
  final List<String> images;

  ItemModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.creationAt,
    required this.updatedAt,
    required this.category,
    required this.images,
  });

  String get creationDate => DateFormat('MM-dd-yyyy HH:mm').format(
        DateTime.parse(creationAt).toLocal(),
      );
}
