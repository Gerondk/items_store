import '../../../../core/domain/bookmarked_item.dart';

sealed class BookmarkedEvent {
  const BookmarkedEvent();
}

class BookmarkedEventLoad extends BookmarkedEvent {
  final List<BookmarkedItem> items;
  const BookmarkedEventLoad(this.items);
}

class BookmarkedEventDelete extends BookmarkedEvent {
  final int bookmarkedItemId;
  const BookmarkedEventDelete(this.bookmarkedItemId);
}

class BookmarkedEventAddItem extends BookmarkedEvent {
  final BookmarkedItem bookmarkedItem;
  const BookmarkedEventAddItem(this.bookmarkedItem);
}
