abstract class ItemDetailEvent {}

final class ItemDetailEventGetItem extends ItemDetailEvent {
  final int itemId;

  ItemDetailEventGetItem({required this.itemId});
}
