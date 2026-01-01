import 'package:items_store/core/domain/bookmarked_item.dart';

abstract class BookmarkedItemsRepository {
  Stream<List<BookmarkedItem>> getItems();

  Future<void> insertItem(BookmarkedItem item);

  Future<void> deleteItemById(int id);
}
