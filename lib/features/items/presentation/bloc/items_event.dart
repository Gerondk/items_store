part of 'items_bloc.dart';

sealed class ItemsEvent {
  const ItemsEvent();
}

final class ItemsEventGetItems extends ItemsEvent {
  const ItemsEventGetItems();
}
