part of 'items_bloc.dart';

sealed class ItemsState {
  const ItemsState();
}

final class ItemsInitial extends ItemsState {}

final class ItemsLoading extends ItemsState {}

final class ItemsLoaded extends ItemsState {
  final List<ItemModel> items;

  const ItemsLoaded({required this.items});
}

final class ItemsError extends ItemsState {
  final String message;

  const ItemsError({required this.message});
}
