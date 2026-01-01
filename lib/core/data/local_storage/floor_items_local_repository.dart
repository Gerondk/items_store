import 'package:items_store/core/data/local_storage/bookmarked_items_database.dart';
import 'package:items_store/core/domain/bookmarked_item.dart';
import 'package:items_store/core/domain/bookmarked_items_repository.dart';

import 'bookmarked_item_entity.dart';

class FloorItemsLocalRepository extends BookmarkedItemsRepository {
  final BookmarkedItemsDatabase _bookmarkedItemsDatabase;
  FloorItemsLocalRepository(this._bookmarkedItemsDatabase);

  @override
  Stream<List<BookmarkedItem>> getItems() {
    return _bookmarkedItemsDatabase.bookedItemsDao.getAllBookedItems().map(
      (event) => event
          .map(
            (e) => BookmarkedItem(
              id: e.id,
              name: e.title,
              description: e.description,
            ),
          )
          .toList(),
    );
  }

  @override
  Future<void> insertItem(BookmarkedItem item) {
    return _bookmarkedItemsDatabase.bookedItemsDao.insertBookedItems(
      BookmarkedItemEntity(
        id: item.id,
        title: item.name,
        description: item.description,
      ),
    );
  }

  @override
  Future<void> deleteItemById(int id) {
    return _bookmarkedItemsDatabase.bookedItemsDao.deleteItemById(id);
  }
}
