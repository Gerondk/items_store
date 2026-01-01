import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:items_store/core/domain/bookmarked_items_repository.dart';

import '../../domain/items_repository.dart';
import 'item_detail_event.dart';
import 'item_detail_state.dart';

class ItemDetailBloc extends Bloc<ItemDetailEvent, ItemDetailState> {
  final BookmarkedItemsRepository _bookmarkedItemsRepository;
  final ItemsRepository _itemsRepository;

  ItemDetailBloc(this._itemsRepository, this._bookmarkedItemsRepository)
    : super(ItemDetailLoading()) {
    on<ItemDetailEventGetItem>((event, emit) async {
      emit(ItemDetailLoading());
      try {
        final item = await _itemsRepository.getItemById(event.itemId);
        emit(ItemDetailLoaded(item: item));
      } catch (e) {
        emit(ItemDetailError(message: e.toString()));
      }
    });

    on<ItemDetailEventBookmarkItem>(_onItemDetailEventBookmarkItem);
  }

  Future<void> _onItemDetailEventBookmarkItem(
    ItemDetailEventBookmarkItem event,
    Emitter<ItemDetailState> emit,
  ) async {
    await _bookmarkedItemsRepository.insertItem(event.bookmarkedItem);
    log('ItemDetailBloc bookmarkedItem id: ${event.bookmarkedItem.id}');
  }
}
