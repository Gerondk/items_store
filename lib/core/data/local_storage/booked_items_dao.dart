import 'package:floor/floor.dart';
import 'package:items_store/core/data/local_storage/bookmarked_item_entity.dart';

@dao
abstract class BookedItemsDao {
  @Query('SELECT * FROM BookmarkedItemEntity')
  Stream<List<BookmarkedItemEntity>> getAllBookedItems();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertBookedItems(BookmarkedItemEntity item);

  @Query('DELETE FROM BookmarkedItemEntity WHERE id = :id')
  Future<void> deleteItemById(int id);
}
