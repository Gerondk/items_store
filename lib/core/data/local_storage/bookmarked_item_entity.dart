import 'package:floor/floor.dart';

@entity
class BookmarkedItemEntity {
  @primaryKey
  final int id;
  final String title;
  final String description;

  const BookmarkedItemEntity({
    required this.id,
    required this.title,
    required this.description,
  });
}
