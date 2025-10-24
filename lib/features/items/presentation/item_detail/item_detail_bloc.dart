import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/items_repository.dart';
import 'item_detail_event.dart';
import 'item_detail_state.dart';

class ItemDetailBloc extends Bloc<ItemDetailEvent, ItemDetailState> {
  final ItemsRepository _itemsRepository;

  ItemDetailBloc(this._itemsRepository) : super(ItemDetailLoading()) {
    on<ItemDetailEventGetItem>(
      (event, emit) async {
        emit(ItemDetailLoading());
        try {
          final item = await _itemsRepository.getItemById(event.itemId);
          emit(ItemDetailLoaded(item: item));
        } catch (e) {
          emit(ItemDetailError(message: e.toString()));
        }
      },
    );
  }
}
