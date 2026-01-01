import 'package:items_store/core/domain/bookmarked_item.dart';

abstract class ItemDetailEvent {}

final class ItemDetailEventGetItem extends ItemDetailEvent {
  final int itemId;
  ItemDetailEventGetItem({required this.itemId});
}

final class ItemDetailEventBookmarkItem extends ItemDetailEvent {
  final BookmarkedItem bookmarkedItem;
  ItemDetailEventBookmarkItem(this.bookmarkedItem);
}
