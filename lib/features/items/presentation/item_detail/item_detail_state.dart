import 'package:items_store/features/items/domain/model.dart';

sealed class ItemDetailState {}

final class ItemDetailLoading extends ItemDetailState {}

final class ItemDetailLoaded extends ItemDetailState {
  final ItemModel item;
  ItemDetailLoaded({required this.item});
}

final class ItemDetailError extends ItemDetailState {
  final String message;
  ItemDetailError({required this.message});
}
